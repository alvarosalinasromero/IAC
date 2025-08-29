
# create a security group
resource "aws_security_group" "prod" {
  name        = "production-sg"
  description = "SG production servers"
}