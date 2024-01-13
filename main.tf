resource "aws_ssm_parameter" "ssm1" {
  name = "ssm1"
  type = "String"
  value = "bar"
}