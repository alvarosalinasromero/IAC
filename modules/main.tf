
provider "aws" {
  region = "eu-west-1"
}

module "sg" {
    source = "./SG"
}