/*

lifecyvle prevent_destroy is used to prevent the resource from being destroyed

*/
resource "aws_instance" "name" {
    ami           = "ami-0a89fa9a6d8c7ad98"
    instance_type = "t3.micro"

    lifecycle {
      prevent_destroy = true
    }

    lifecycle {
      ignore_changes = [ tags ]
    }
}