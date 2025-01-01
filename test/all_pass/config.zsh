resources='test/all_pass'

command="echo Name: <N>. Resources: ${resources}"

typeset -A test_cases=(
  [first]="${command}"
  [second]="${command}"
)
