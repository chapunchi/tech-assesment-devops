resource "aws_ssm_parameter" "ssm1" {
  name = "foo"
  type = "String"
  value = "bar"
}