
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_s3_bucket" "lab_bucket" {
  bucket = "my-unique-lab-bucket-123456"

  tags = {
    Name        = "Lab Bucket"
    Environment = "Dev"
  }
}