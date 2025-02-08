/*

In this example we are using the flag -target to specify a specific resource to be created or destroyed.
Command to run: terraform plan -target local_file.test
Command to run: terraform apply -target="local_file.test"

*/

resource "aws_iam_user" "name" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

# create a security group
resource "aws_security_group" "allow_tls" {
  name        = "myfirewall"
  description = "Firewall for the server"
}

resource "local_file" "test" {
  content = "Hello world"
  filename = "${path.module}/test.txt"
}