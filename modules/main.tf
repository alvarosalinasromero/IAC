
provider "aws" {
  region = "eu-west-1"
}

module "instance" {
  source = "./instance"
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = module.sg.security_group_ids
  tags = {
    Name = "my-instance"
    Environment = "dev"
    Project = "IAC"
  }
}

module "sg" {
    source = "./SG"
}