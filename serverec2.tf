provider "aws" {
  region     = "eu-north-1"
  access_key = "AKIA5FTZAGOHFCJFXK5Q"
  secret_key = "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"
}

resource "aws_instance" "server2" {
  ami           = "ami-05git edb7c94b324f73c"
  instance_type = "t3.micro"
}