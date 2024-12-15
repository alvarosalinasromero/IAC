# provider is plugin to download the resource
provider "aws" {
  region     = "eu-north-1"
}

# create a security group
resource "aws_security_group" "newsg" {
  name        = "myfirewall"
  description = "Firewall for the server"
}

# adding output
output "security_group_id" {
  value = aws_security_group.newsg.name
}