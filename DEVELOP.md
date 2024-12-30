# Developing ZGold

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
