# ZGold

Tool written in Zsh for implementing simple golden tests on stdout/stderr.

## Features

- Declarative test cases specification.
- Can be used to test software written in any language.
- View diffs of non-passing tests using [delta](https://github.com/dandavison/delta).
- Patch the golden files of failing test cases.

## Installation

1. Install [GNU Make](https://www.gnu.org/software/make/). On macOS it's
   installed with the Xcode Command Line Tools. Run `make -v` to check.
2. In a clone of this repo run `make`. Currently Homebrew is assumed as the
   package manager.

## Usage

See the built-in help with `zgold --help`

Example: `zgold test/pass_fail/config.zsh run`

## License

[MIT](./LICENSE)
