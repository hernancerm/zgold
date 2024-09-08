# Developing Gold

## Versioning

<https://semver.org/>

Doing a release:

1. Create a commit to set the proper version printed by the `-v` option. Check the previous release
   version and in-between commits to assign the correct value according to semver. This is necessary
   because there is no attempt to plan for a specific next version. The commit message should be
   `release: <semver-version>`.
2. Tag the release commit with the semver version.
3. Create a commit to set the version printed by the `-v` option to a patch increment with the
   suffix `-dev`, to indicate a development version. This consistent patch increment is just to get
   a placeholder next version as development progresses. The commit message should be: `release: set
   next dev version`.

## Learning Zsh for scripting

The best resource I've found for learning Zsh scripting is the manual pages themselves. To open a
manual page (man page) execute `man <page>`, e.g., `man zshparam`. Below are the pages I've found
the most relevant:

| Manual page | Contents |
| --- | --- |
| zsh | Index of all man pages. |
| zshbuiltins | Built-in functions, e.g., `typset`, `local`, `true`. |
| zshmisc | Includes control statements, e.g., `if`, `while`, `for`, `case`. |
| zshparam | Parameters. This is Zsh's approach to variables. |
| zshexpn | Parameter expansion. This covers expresions beginning with `$.` |
| zshoptions | Options, e.g., `BEEP`, `HIST_IGNORE_DUPS`. |

For a more pleasant experience viewing man pages, consider using
[`spub-nvim-man`](https://github.com/hernancerm/scripts.public/blob/main/spub-nvim-man) (requires
[Neovim](https://neovim.io/)). Once you have the script, execute it with a single argument being the
name of the man page.

Other resources:
- [A User's Guide to the Z-Shell, by Peter Stephenson (2003)](https://zsh.sourceforge.io/Guide/zshguide.html).
- Debugger for Zsh: <https://github.com/rocky/zshdb>. Install with Homebrew: `brew install zshdb`.
