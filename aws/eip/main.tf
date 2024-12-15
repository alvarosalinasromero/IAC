# Elastic IP
# address is a static, public IPv4 address designed specifically for the dynamic nature of cloud computing. This feature allows you to associate an Elastic IP address with any instance or network interface within any Virtual Private Cloud (VPC) in your AWS account.

resource "aws_eip" "eip" {
    instance = aws_instance.server2.id
}