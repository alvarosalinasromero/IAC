# terraform {
#     required_version = ">= 1.10.0"
#     required_providers {
#         aws = {
#         source = "hashicorp/aws"
#         version = "~> 6.0"
#         }
#     }
# }
/*
provider "aws" {
   region     = us-east-1
   access_key = data.vault_aws_access_credentials.creds.access_key
   secret_key = data.vault_aws_access_credentials.creds.secret_key
}
*/
# locals {
#   nombre = "alvaro"
#   telephone = 633888000
#   address = "Canada"
# }

variable "name" {
  type = string
  default = "Alvaro"
}

variable "telephone" {
  type = string
  default = "633888000"
}
variable "city" {
  type = string
  default = "Canada"
}

output "name" {
  value = var.name
  sensitive = true
}

output "telephone" {
  value = var.telephone
}

output "city" {
  value = var.city
  sensitive = false
}
