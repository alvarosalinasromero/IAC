/*

most_recent = true: This tells Terraform to fetch the most recent AMI that matches the filter criteria.
owners = ["amazon"]: This specifies that the AMI should be owned by Amazon.
*/

data "aws_ami" "demoami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"] 
  }
}

resource "aws_instance" "server" {
  ami = "${data.aws_ami.demoami.id}"
  instance_type = "t3.micro"

  tags = {
    Name = "server"
    description = "Amazon Linux 2023 instance with kernel 6.1-x86_64"
  }
  
}