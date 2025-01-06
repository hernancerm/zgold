resources='demo/should_take_long_to_run'

typeset -A test_cases=(
  succeeds_in_2_seconds
  "sleep 2; echo 'At last.'"
)
