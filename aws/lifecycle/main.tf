/*

lifecycle is used to manage the lifecycle of the resource.
In this case, the resource will be created before it is destroyed

*/

resource "aws_instance" "server2" {
  ami           = "ami-0a89fa9a6d8c7ad98"
  instance_type = "t3.micro"

  tags = {
    Name = "server2"
  }

  lifecycle {
    create_before_destroy = true
  }

}