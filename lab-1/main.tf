
data "aws_region" "current" {}
data "aws_availability_zones" "available" {}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block       = "10.50.0.0/20"
  instance_tenancy = "default"

  tags = {
    vpc = "terraformlab"
  }
}

# Resource to create a public subnet in each AZ
# resource "aws_subnet" "public" {
#   count = 3

#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.public_subnet_cidrs[count.index]
#   availability_zone = var.availability_zone[count.index] # Use the AZ from the list based on the count

#   tags = {
#     subnet = "subnetpublics"
#   }
# }

# # Resource to create a private subnet in each AZ
# resource "aws_subnet" "private" {
#   count = 3

#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.private_subnet_cidrs[count.index]
#   availability_zone = var.availability_zone[count.index] # Use the AZ from the list based on the count

#   tags = {
#     subnet = "subnetsprivates"
#   }
# }
#Deploy the private subnets
resource "aws_subnet" "private_subnets" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, each.value)
  availability_zone = tolist(data.aws_availability_zones.available.names)[each.value]

  tags = {
    Name      = each.key
    Terraform = "true"
  }
}

#Deploy the public subnets
resource "aws_subnet" "public_subnets" {
  for_each                = var.public_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, each.value + 100)
  availability_zone       = tolist(data.aws_availability_zones.available.names)[each.value]
  map_public_ip_on_launch = true

  tags = {
    Name      = each.key
    Terraform = "true"
  }
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
    Name = "public_rt"
  }
}