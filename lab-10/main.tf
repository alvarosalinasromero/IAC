/*
Exercise 10: Dynamic Blocks
In this exercise, you will create a security group with dynamic ingress rules using Terraform. 
The rules will be defined in a local variable and applied to the security group using a dynamic block.
*/

# Create a VPC
resource "aws_vpc" "vpcdynamic" {
  cidr_block       = "10.0.0.0/20"
  instance_tenancy = "default"

  tags = {
    vpc = "vpc-dynamic-blocks"
  }
}

locals {
  config_rules = [{
    port = 443
    description = "Allow HTTPS from VPC"
  }, 
  {
    port = 80
    description = "Allow HTTP from VPC"
  }]
}

variable "web_ingress" {
    type = map(object({
      description = string
      port = number
      protocol = string
      cidr_blocks = list(string)
    }))
  default = {
    "80" = {
      description = "Allow HTTP from VPC"
      port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "443" = {
      description = "Allow HTTPS from VPC"
      port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    "22" = {
      description = "Allow SSH from VPC"
      port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_security_group" "this" {
    name        = "allow_ssh"
    description = "Allow SSH inbound traffic"
    vpc_id      = "${aws_vpc.vpcdynamic.id}"
    
    dynamic "ingress" {
      for_each = var.web_ingress
      content {
        description = ingress.value.description
        from_port   = ingress.value.port
        to_port     = ingress.value.port
        protocol    = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
      }
    }
}

output "vpc_id" {
  value = aws_vpc.vpcdynamic.id
}

output "sg_id" {
  value = aws_security_group.this.id
}

output "sg_name" {
  value = "The ports allowed are: ${join(", ", keys(var.web_ingress))}"
}