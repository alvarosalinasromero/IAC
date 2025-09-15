terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

module "development_vpc" {
  source = "./.."
  vpc_name = "development-vpc"
  cidr_block = "10.0.0.0/16"
}


# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

# output "ami_id" {
#   value = data.aws_ami.ubuntu.id
# }

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"] # El propietario es Amazon

  filter {
    name   = "name"
    # El patrón de nombre para Amazon Linux 2023
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_name" {
  value = data.aws_ami.amazon_linux_2023.name
}

output "ami_id" {
  value = data.aws_ami.amazon_linux_2023.id
}

output "vpc_id" {
  value = module.development_vpc.vpc_id
}


resource "aws_instance" "demo-server" {
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    module.development_vpc.vpc_id
  ]

  tags = {
    Name = "DemoServer"
    VPC = module.development_vpc.vpc_id
    AMI = data.aws_ami.amazon_linux_2023.id
  }
  
}