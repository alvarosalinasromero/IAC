terraform {
    required_version = ">= 1.10.0"
    required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
        }
    }
}
# Si alguien intenta usar instance_count = 3, Terraform lanzará un error antes de aplicar.

variable "instance_count" {
  type = number
  default = 2

  validation {
    condition = var.instance_count == 2
    error_message = "Instance count must be 2"
  }
}

variable "ami" {
  type = string
  description = "Amazon Linux 2 AMI (HVM), SSD Volume Type"
}

variable "instance_type" {
  type = string
  description = "Instance type"
}

resource "aws_instance" "linux" {
  count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type
}