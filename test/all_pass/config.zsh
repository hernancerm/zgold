resources='test/all_pass'

typeset -A test_cases=(
  first
  "echo 'A test case. Resources: ${resources}'"
  second
  "echo 'Another test case. Resources: ${resources}'"
)
