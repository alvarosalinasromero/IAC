
provider "aws" {
  region = "eu-west-1"
}

module "sg" {
    source = "./SG"
}

module "instance" {
  source = "./instance"

  instance_count = 3
  instance_name = "webserver"
  ami = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = module.sg.security_group_ids

  tags = {
    Environment = "dev"
    Project = "IAC-webapp"
  }
}