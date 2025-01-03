resources='test/pre_diff_hooks'

typeset -A test_cases=(
  timestamp
  "date +'%d/%m/%y@%H:%M:%S'; echo 'The line above changes on every run.'"
)

# Substitute the first line of stdin with `{timestamp}`.
pre_diff_hook_cmd="$(cat <<'EOF'
awk '
  NR == 1 {
    print "{timestamp}"
  }
  {
    if (NR != 1) {
      print($0)
    }
  }
'
EOF
)"

typeset -A pre_diff_hooks=(
  timestamp
  "${pre_diff_hook_cmd}"
)
