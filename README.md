# Gold

Tool written in Zsh for implementing simple [golden
tests](https://ro-che.info/articles/2017-12-04-golden-tests) on stdout/stderr.

<table>
  <tr>
    <th>All pass</th>
    <th>One passes, one fails</th>
  </tr>
  <tr>
    <th><img src="./media/all_pass.png"></th>
    <th><img src="./media/pass_fail.png"></th>
  </tr>
</table>

## Features

- Name test cases for easy identification in the output.
- Declarative approach, leveraging a Zsh file to provide configuration and resource files.
- Can be used to test software written in any language. The output of the binaries is what is tested.
- When a test case does not pass, the diff is nicely displayed using [delta](https://github.com/dandavison/delta).
- Patch the golden files of failing test cases.

## Requirements

- `zsh` — <https://zsh.sourceforge.io>
  - In macOS this should already be installed.
- `delta` (optional) — <https://github.com/dandavison/delta>
  - Install with [Homebrew](https://brew.sh/): `brew install git-delta`.

## Installation

Execute the script [install.zsh](./install.zsh):

```
source install.zsh
```

## Usage

See the built-in help with `gold --help`.

For an example usage, refer to the directory [test](./test).

Example configuration run: `./gold test/pass_fail/config.zsh run-all`.

## License

[MIT](./LICENSE)
