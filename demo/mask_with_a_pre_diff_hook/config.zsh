resources='demo/mask_with_a_pre_diff_hook'

typeset -A test_cases=(
  mask_timestamp
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
  mask_timestamp
  "${pre_diff_hook_cmd}"
)
