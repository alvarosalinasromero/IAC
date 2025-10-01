terraform {
    required_version = ">= 1.10.0"
    required_providers {
        aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
        }
    }
}

module "web_server" {
  source = "../"
  ami = "ami-091a906f2e1e40076" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"

}