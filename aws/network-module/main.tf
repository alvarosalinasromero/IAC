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

resource "aws_vpc" "nuevo" {
  cidr_block = var.cidr_block
  
  tags = {
    Name = var.vpc_name
  }
}

variable "cidr_block" {
  description = "El bloque CIDR para la VPC."
  type        = string
}

variable "vpc_name" {
  description = "El nombre de la VPC."
  type        = string
}


output "vpc_id" {
  value = aws_vpc.nuevo.id
}

output "cidr_block" {
  value = aws_vpc.nuevo.cidr_block
}


