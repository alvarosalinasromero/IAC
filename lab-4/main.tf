# Lab4 - Create users and show a output usinng with total users with length function.

# Provider configuration
terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
    local = {
      source = "hashicorp/local"
      version = "~> 2.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

# Variables definition
variable "users" {
  type    = list(string)
  default = ["alice", "bob", "charlie"]
}

variable "environment" {
  type    = string
  default = "pre"
}

variable "locations"{
  description = "Location"
  type = list(string)
  default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "project" {
  description = "Project Name"
  type = string
  default = "Myapp"
}

variable "ingress_rules" {
  description = "Allowed ports"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = {
    ssh = {
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
      description = "SSH"
    }
    http = {
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTP"
    }
  }
}

resource "tls_private_key" "tlskey" {
  algorithm = "RSA"
}

resource "local_file" "sshkey" {
  content = tls_private_key.tlskey.private_key_pem
  filename = "Myawskey.pem"
}

resource "aws_key_pair" "lab_key" {
  key_name   = "myawskey"
  public_key = tls_private_key.tlskey.public_key_openssh
}

# Creation of IAM users
resource "aws_iam_user" "users" {
  name = var.users[count.index]
  count = 3
  #count = length(var.users)
  path = "/system/"
}

output "name" {
  value = "Total users: ${length(var.users)}"
}

# Creation of bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "${lower(var.project)}-nirvanabucket"
  tags = {
    environment = "${upper(var.environment)}"
    location = "${lower(var.locations[0])}"  # Accessing the first element of the locations list
  }
}

# Creation of security group with dynamic block
resource "aws_security_group" "web_sg" {
  name        = "lab-web-sg"
  description = "SG Dynamic"
  vpc_id      = "vpc-060dd0fa37bfb4264"

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }
  egress {
    description = "All outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creation of EC2 instance
# resource "aws_instance" "web_instance" {
#   ami                         = "ami-091a906f2e1e40076"
#   instance_type               = "t2.micro"
#   vpc_security_group_ids      = [aws_security_group.web_sg.id]
#   associate_public_ip_address = true
#   key_name                    = aws_key_pair.lab_key.key_name
#   connection {
#     user = "ec2-user"
#     private_key = tls_private_key.tlskey.private_key_pem
#     host = self.public_ip
#   }

#   provisioner "local-exec" {
#     command = "chmod 600 ${local_file.sshkey.filename}"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo yum install -y httpd",
#       "sudo systemctl start httpd",
#       "sudo systemctl enable httpd",
#       "echo '<h1> Deployed by ${var.project} in ${var.environment} environment </h1>' | sudo tee /var/www/html/index.html"
#     ]
#   }

#   tags = {
#     Name        = "WebInstance"
#     Environment = "${upper(var.environment)}"
#     Location    = "${lower(var.locations[0])}"
#   }
# }
output "bucketlocation" {
  value = "Deploying in: ${aws_s3_bucket.my_bucket.tags["location"]}"
}