# Developing ZGold

## Guidelines

1. For every function added or modified, comply with what is described in the
   sections [Comment docs](#comment-docs).

## Comment docs

```sh
## Salute the callee.
## @param $1 First name.
## @param $2 Age in years.
## @stdout Greeting.
function greet {
  echo "My name is ${1} and I'm ${2} yo."
}
```

Javadoc-like comments are used to document Zsh functions. There is no tool which
provides support for these, it's just an ad-hoc standard. These comments begin
with two pound symbols (#) followed by an annotation, an optional [data
type](#data-types-for-comment-docs) and an optional description.

| Annotation             | Explanation                                                |
|------------------------|------------------------------------------------------------|
| `@param[:{type}] ${n}` | Function param, e.g., `@param $1`, `@param:int $1 Index.`  |
| `@stdin[:{type}]`      | Standard input, e.g., `@stdin File contents of users.txt.` |
| `@stdout[:{type}]`     | Standard output, e.g., `@stdout Greeting.`                 |
| `@return ${n}`         | Function's exit code, e.g., `0`, `1`.                      |

## Data types for comment docs

**These are not Zsh data types but rather documentation hints** on how to handle
the values, so the programmer is less lost in the fuziness of dynamic typing.
The actual Zsh data types are defined using the `typeset` builtin. Numerically
indexed arrays are defined using `typeset -a`; associative arrays are defined
using `typeset -A`.

**The data types iarray, ciarray, aarray and caarray, along with the `tac`
function, are useful to emulate passing arrays by value to functions. This
avoids functions being coupled to global parameters.**

- `int`: Integer.
- `string`: Plain text.
- `iarray`: Given *x* as a **numerically indexed array param**, the type iarray
  is the output of `typeset -p x`, which is a sourceable array definition.
    - Example: `typeset -a x=( red 'yellowish green' blue )`.
    - Use case: Passing an array with a *specific name* to the caller.
- `ciarray`: Contents within the parentheses of an iarray.
    - Example: `red 'yellowish green' blue`
    - Use case: Passing an array to the caller. The caller decides the array
      name using `eval`.
- `aarray`: Given *x* as an **associative array param**, the type aarray is the
  output of `typeset -p x`, which is a sourceable array definition.
    - Example: `typeset -A x=( [color]=blue [name]='Hernan Cervera' )`
    - Use case: Passing an array with a *specific name* to the caller.
- `caarray`: Contents within the parentheses of an aarray.
    - Example: `[color]=blue [name]='Hernan Cervera'`
    - Use case: Passing an array to the caller. The caller decides the array
      name using `eval`.

Function `tac`: Convert either iarray→ciarray or aarray→caarray:

```sh
## To Array Contents.
## If the arg $1 is an iarray, then stdout is a ciarray.
## If the arg $1 is an aarray, then stdout is a caarray.
## @param:iarray|aarray $1
## @stdout:ciarray|caarray
function tac {
  echo "${${(S)${1}/*=/}[3,-3]}"
}
```

## Zsh recipes

Pass a numerically indexed array to a function:

```sh
## @param:ciarray $1
## @stdout:string Pretty-printed array definition.
function pretty_print_array {
  eval "local -a array=(${1})"
  typeset -p 1 array
}

typeset -a names=(
  'Hernán Cervera'
  'Dwayne "The Rock" Johnson'
  "Juan's Apostrophe"
)

pretty_print_array "$(tac "$(typeset names)")"
# typeset -a array=(
#   'Hernán Cervera'
#   'Dwayne "The Rock" Johnson'
#   'Juan'\''s Apostrophe'
# )
```

Pass an associative array to a function:

```sh
## @param:caarray $1
## @stdout:string Pretty-printed array definition.
function pretty_print_array {
  eval "local -A array=(${1})"
  typeset -p 1 array
}

typeset -A name_to_mood=(
  ['Hernán Cervera']=good
  ['Dwayne "The Rock" Johnson']='always confident'
  ["Juan's Apostrophe"]=exhilarated
)

pretty_print_array "$(tac "$(typeset name_to_mood)")"
# typeset -A array=(
#   ['Dwayne "The Rock" Johnson']='always confident'
#   ['Hernán Cervera']=good
#   ['Juan'\''s Apostrophe']=exhilarated
# )
```

Return a numerically indexed array from a function:

```sh
## @stdout:ciarray
function print_ciarray {
  typeset -a names=(
    'Hernán Cervera'
    'Dwayne "The Rock" Johnson'
    "Juan's Apostrophe"
  )
  tac "$(typeset names)"
}

eval "typeset -a names_from_fn=($(print_ciarray))"
typeset -p 1 names_from_fn
# typeset -a names_from_fn=(
#   'Hernán Cervera'
#   'Dwayne "The Rock" Johnson'
#   'Juan'\''s Apostrophe'
# )
```

Return an associative array from a function:

```sh
## @stdout:caarray
function print_caarray {
  local -A name_to_mood=(
    ['Hernán Cervera']=good
    ['Dwayne "The Rock" Johnson']='always confident'
    ["Juan's Apostrophe"]=exhilarated
  )
  tac "$(typeset name_to_mood)"
}

eval "typeset -A name_to_mood_from_fn=($(print_caarray))"
typeset -p 1 name_to_mood_from_fn
# typeset -A name_to_mood_from_fn=(
#   ['Dwayne "The Rock" Johnson']='always confident'
#   ['Hernán Cervera']=good
#   ['Juan'\''s Apostrophe']=exhilarated
# )
```

## Versioning

<https://semver.org/>

## Releasing

1. Create a commit to set the proper version printed by the `-v` option. Check
   the previous release version and in-between commits to assign the correct
   value according to semver. This is necessary because there is no attempt to
   plan for a specific next version. The commit message is: `release:
   <semver-version>`.
2. Tag the release commit with the semver version.
3. Create a commit to set the version printed by the `-v` option to a patch
   increment with the suffix `-dev`, to indicate a development version. This
   consistent patch increment is just to get a placeholder next version as
   development progresses. The commit message is: `release: set next dev
   version`.
4. Create a GitHub release from the Git tag.

## Learning Zsh

To learn how to script in Zsh, the best resource I know of is the man pages
themselves, mainly [`zshparam`](https://linux.die.net/man/1/zshparam) and
[`zshexpn`](https://linux.die.net/man/1/zshexpn). I don't mean this in a
negative manner, I found those pages straight to the point and a lot can be
learned from reading them top to bottom; although I would not recommend to read
them fully since they are also meant to be reference docs rather than guides.
You can read them online, or in your terminal using the `man` command, e.g. `man
zshparam`. Below are other man pages I find relevant:

| Man page    | Content                                                  |
|-------------|----------------------------------------------------------|
| zsh         | Index of all Zsh man pages.                              |
| zshparam    | Parameters; Zsh's approach to variables.                 |
| zshexpn     | Parameter expansion; expresions starting with `$`.       |
| zshmisc     | Control statements, e.g., `if`, `while`, `for`, `while`. |
| zshbuiltins | Built-in functions, e.g., `typset`, `local`, `true`.     |
| zshoptions  | Options, e.g., `BEEP`, `HIST_IGNORE_DUPS`.               |

Other resources:
- [A User's Guide to the Z-Shell, by Peter Stephenson
  (2003)](https://zsh.sourceforge.io/Guide/zshguide.html).

## Debugging Zsh

- My favorite: good 'ol print statements (`echo` in this case). You can use
  the built-in command `exit` to end the script execution right after the
  `echo`, that way parts of the script can be easily skipped.
- Alternatively, there is a debugger, [zshdb](https://github.com/rocky/zshdb),
  which can be installed with Homebrew: `brew install zshdb`. I have not found
  editor/IDE integration, so it's somewhat uncomfortable to use.
- To force print to the terminal redirect the output to `/dev/tty`. This is
  useful for inspecting parameters in functions, where the stdout of a regular
  echo would be consumed by the caller.
