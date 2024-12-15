# provider is plugin to download the resource
provider "aws" {
  region     = "eu-north-1"
}

# create a security group
resource "aws_security_group" "newsg" {
  name        = "myfirewall"
  description = "Firewall for the server"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.newsg.id
  cidr_ipv4         = var.sg_ip
  from_port         = var.sg_port_http
  ip_protocol       = var.sg_protocol
  to_port           = var.sg_port_http
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.newsg.id
  cidr_ipv4         = var.sg_ip
  from_port         = var.sg_port_https
  ip_protocol       = var.sg_protocol
  to_port           = var.sg_port_https
}

#terraform plan -var-file="common.tfvars"