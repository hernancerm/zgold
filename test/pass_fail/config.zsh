resources='test/pass_fail'

typeset -A test_cases=(
  first
  "echo 'A test case. Resources: ${resources}'"
  second
  "echo 'Another test case. Resources: ${resources}'"
)
