
/*

Tainting resource is used to replace the resource

terraform apply -replace="aws_instance.server2" 

*/

resource "aws_instance" "server2" {
  ami           = "ami-094a9a574d190f541"
  instance_type = "t3.micro"
}