
resource "aws_instance" "server2" {
  ami           = "ami-05edb7c94b324f73c"
  instance_type = "t3.micro"

  tags = {
    Name = "server4"
  }

}