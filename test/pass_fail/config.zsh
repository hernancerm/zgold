resources='test/pass_fail/rsc'

command="echo Name: <N>. Resources: ${resources}"

typeset -A test_cases=(
  [first]="${command}"
  [second]="${command}"
)
