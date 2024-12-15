# Elastic IP
# address is a static, public IPv4 address designed specifically for the dynamic nature of cloud computing. This feature allows you to associate an Elastic IP address with any instance or network interface within any Virtual Private Cloud (VPC) in your AWS account.

# Create a new Elastic IP
resource "aws_eip" "ipstatic" {
    domain = "vpc"
}

# Create a security group
resource "aws_security_group" "allow_tls" {
  name        = "myfirewall"
  description = "Firewall for the server"
}

# inbound rule to allow traffic with elastic ip
resource "aws_vpc_security_group_ingress_rule" "sgnew" {
  security_group_id = aws_security_group.sgnew.id
  cidr_ipv4         = "${aws_eip.ipstatic.public_ip}/32"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}