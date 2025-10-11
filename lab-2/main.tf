

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.50.0.0/20"
  instance_tenancy = "default"

  tags = {
    vpc = "terraformlab"
  }
}

#Deploy the private subnets
# resource "aws_subnet" "private_subnets" {
#   for_each          = var.private_subnet
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = cidrsubnet(var.vpc_cidr, 8, each.value.cidr)
#   availability_zone = each.value.az
# }

#Deploy the public subnets
# resource "aws_subnet" "public_subnets" {
#   for_each                = var.public_subnets
#   vpc_id                  = aws_vpc.main.id
#   cidr_block              = cidrsubnet(var.vpc_cidr, 8, each.value.cidr_index + 100)
#   availability_zone       = each.value.az
#   map_public_ip_on_launch = true
# }

# resource "aws_subnet" "list_subnet" {
#   vpc_id = aws_vpc.main.id
#   cidr_block = var.ips["pro"]
#   availability_zone = var.azs[0]
# }

# resource "aws_subnet" "list_subnet" {
#   for_each = var.ips
#   vpc_id = aws_vpc.main.id
#   cidr_block = each.value
#   availability_zone = var.azs[0]
# }

resource "aws_subnet" "list_subnet" {
  for_each          = var.subnet_config
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.ip
  availability_zone = each.value.az
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    igw = "terraform-igw"
  }
}

# Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "route-table-public"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = []
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = []
  }

  tags = {
    Name = "${var.project}-${var.location}-SecurityGroup"
    env  = "sg-${var.env}"
  }
}
