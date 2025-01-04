/*

This is a simple example of how to use count.index in Terraform.

*/

resource "aws_instance" "server" {
  ami           = "ami-02df5cb5ad97983ba"
  instance_type = "t3.micro"
  count = 2

  tags = {
    Name = "server-${count.index}"
  }

}
