# Developing gold

## Versioning

<https://semver.org/>

Doing a release:

1. Create a commit to set the proper version printed by `diffenvs -v`. Check the previous release
   version and in-between commits to assign the correct value according to semver. This is necessary
   because there is no attempt to plan for a specific next version for Gold. The commit message
   should be `release: <semver-version>`.
2. Tag the release commit with the semver version.
3. Create a commit to set the version printed by `diffenvs -v` to a patch increment with the suffix
   `-dev`, to indicate a development version. This consistent patch increment is just to get a
   placeholder next version as development progresses. The commit message should be: `release: set
   next dev version`.

## Learning Zsh scripting

| Manual page | Contents |
| --- | --- |
| zsh | Index of all man pages. |
| zshbuiltins | Built-in functions, e.g., `typset`, `local`, `true`. |
| zshmisc | Includes control statements, e.g., `if`, `while`, `for`, `case`. |
| zshparam | Parameters. This is Zsh's approach to variables. |
| zshexpn | Parameter expansion. This covers expresions beginning with `$.` |
| zshoptions | Options, like `BEEP`. |

For a more pleasant experience viewing man pages, consider using
[`spub-nvim-man`](https://github.com/hernancerm/scripts.public/blob/main/spub-nvim-man) (requires
[Neovim](https://neovim.io/)).

See also: <https://zsh.sourceforge.io/Guide/zshguide.html>

## Debugging

Debugger for Zsh: <https://github.com/rocky/zshdb>

Install with Homebrew: `brew install zshdb`
