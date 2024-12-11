# provider is plugin to download the resource
provider "aws" {
  region     = "eu-north-1"
  access_key = "AKIA5FTZAGOHFCJFXK5Q"
  secret_key = "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"
}

# resource describe one or more insfrastructure objects. Ex: ec2 instance
# aws_instance # name local aws_alb # name local

resource "aws_instance" "server2" {
  ami           = "ami-05edb7c94b324f73c"
  instance_type = "t3.micro"

  tags = {
    Name = "server2"
  }

}