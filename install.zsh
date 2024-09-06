# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"
gold_repo_path="${0:h}"

# Install.
cp -v "${gold_repo_path}"/gold '/usr/local/bin'
