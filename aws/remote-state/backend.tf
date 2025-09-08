terraform {
  backend "s3" {
    bucket = "mybucket-demo-009"
    key    = "demo"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}