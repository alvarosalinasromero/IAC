

# create a security group
resource "aws_security_group" "dev" {
  name        = "mysecuritygroup_dev" // Cuidado con nombres duplicados, pueden causar problemas.
  description = "security gruoup dev"
}

resource "aws_security_group" "prod" {
  name        = "mysecuritygroup_prod" // Cuidado con nombres duplicados, pueden causar problemas.
  description = "security group prod"
}