# ZGold

Zsh command line tool for golden tests on stdout/stderr.

## Features

- Declarative.
- Can be used to test software written in any language.
- View diffs of failed tests in [delta](https://github.com/dandavison/delta).
- Patch golden files.

## Installation

1. Install [GNU Make](https://www.gnu.org/software/make/). On macOS it's
   installed with the Xcode Command Line Tools. Run `make -v` to check.
2. In a clone of this repo run `make`.

Optionally (recommended), install [delta](https://github.com/dandavison/delta).

## Uninstall

Run `make uninstall`.

## Usage

Once ZGold is installed:

- See the built-in help with `zgold --help`.
- For sample output, execute this in this repo: `zgold -b demo/*`.

## Development

[DEVELOP.md](./DEVELOP.md)

## Inspiration

ZGold's output format mirrors that of
[ZUnit](https://github.com/zunit-zsh/zunit).

## License

[MIT](./LICENSE)
