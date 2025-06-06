# ZGold

Zsh command line tool for golden tests on stdout/stderr.

## Features

- Declarative.
- Can be used to test software written in any language.
- View diffs of failed tests in [delta](https://github.com/dandavison/delta).
- Patch golden files.

## Installation

1. Add the [Homebrew](https://brew.sh/) tap:

```
brew tap hernancerm/formulas https://github.com/hernancerm/formulas
```

2. Install ZGold:

```
brew install zgold
```

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
