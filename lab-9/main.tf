/*
Lab9: Create two S3 buckets using a single resource block and the for_each meta-argument.
the function toset() is used to convert a list into a set
this is useful to avoid duplicate values. in this case, we create two buckets: my-bucket-dev and my-bucket-prod
each.key will take the values "dev" and "prod"
*/
terraform {
  required_version = ">= 1.10.0"
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

# resource "aws_s3_bucket" "bucket" {
#   for_each = toset(["dev", "prod"])
#   bucket   = "my-bucket-${each.key}"
# }

# output "name" {
#    value = aws_s3_bucket.bucket[each.key]
# }

// Exercise 2- Validation of Variables
// Add a validation rule to the Environment variable to ensure it contains exactly three environments:

variable "environment" {
  type    = list(string)
  default = ["dev", "staging", "prod"]

  # validation {
  #   condition     = contains(var.Environment, "dev") || contains(var.Environment, "staging") || contains(var.Environment, "prod")
  #   error_message = "The Environment variable must contain exactly three environments: dev, staging, prod"
  # }

  validation {
    condition = alltrue([
      contains(var.environment, "dev"),
      contains(var.environment, "staging"),
      contains(var.environment, "prod")
    ])
    error_message = "The environment variable must contain exactly three environments: dev, staging, prod"
  }
}

// Exercise 3 - Variable instance:count only accepts numbers between 1 and 5

variable "instance_count" {
  type = number

  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 5
    error_message = "The instance_count variable must be a number between 1 and 5"
  }
  
}

resource "aws_instance" "server2" {
  count         = var.instance_count
  ami           = "ami-05edb7c94b324f73c"
  instance_type = "t3.micro"

  tags = {
    Name = "server-web"
  }

}

// Exercise 4 - variable called admin_email that only accepts strings containing the @ character simulating a valid email
variable "admin_email" {
  type = string

  validation {
    condition     = can(regex("@", var.admin_email))
    error_message = "The admin_email variable must contain the @ character"
  }
}
// resource to try the email validation
resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo ${var.admin_email}"
  }
}

// Exercise 5 - Variable called cidr_block that only accepts strings with "10."
variable "cidr_block" {
  type = string

/*
^ means "start of the string".
10 is the literal number.
\\. is a literal dot (.). In Terraform, you need to escape the dot with double backslashes (\\.) 
because a single backslash is used for escaping in HCL, and the dot in regex means "any character" unless escaped.
*/
  validation {
    condition     = can(regex("^10\\.", var.cidr_block))
    error_message = "The cidr_block variable must be a valid CIDR block in the 10.0.0.0/8 range"
  }
}

variable "name" {
  type    = string
}
variable "telephone" {
  type    = number
}

locals {
  contact_info = {
    name  = var.name
    phone = var.telephone
    email = var.admin_email
    cidr  = var.cidr_block
  }
  my_number = nonsensitive(var.telephone)
}

output "name" {
  value = var.name
}

output "telephone" {
  value = var.telephone
}

output "admin_email" {
  value = var.admin_email
}

output "cidr_block" {
  value = var.cidr_block
}