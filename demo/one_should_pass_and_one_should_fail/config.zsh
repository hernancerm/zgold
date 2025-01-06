resources='demo/one_should_pass_and_one_should_fail'

typeset -A test_cases=(
  succeds
  "echo 'Success!'"
  fails
  "echo 'Leave this test failing. It serves as a demo for the diff feature.'"
)
