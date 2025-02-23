

/*
variable "usernames" {
  type = set(string)
  default = ["alvaro","bob","carlos"]
}

resource "aws_iam_user" "users" {
  for_each = var.usernames
  name = each.value
}
*/

variable "mymap" {
    default = {
        "dev" = "ami-123"
        "pro" = "ami-456"
    }
}

resource "aws_instance" "server" {
    for_each = var.mymap
    ami = each.key
    instance_type = "t3.micro"
}