resources='test/pass_fail'

command="echo Name: <N>. Resources: ${resources}"

typeset -A test_cases=(
  first
  "${command}"
  second
  "${command}"
)
