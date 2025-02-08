

/* This part of the code creates 3 IAM users named "iamuser.0", "iamuser.1", and "iamuser.2". 
path: "/system/" it means that the users will be created in the "/system/" path.
*/
resource "aws_iam_user" "name" {
  name = "iamuser.${count.index}"
  count = 3
  path = "/system/"
}

output "users" {
  value = aws_iam_user.name[*].name
}



output "iam_arn" {
  value = aws_iam_user.name[*].arn
}

/*
Results:
Outputs:

iam_arn = [
  "arn:aws:iam::183631349910:user/system/iamuser.0",
  "arn:aws:iam::183631349910:user/system/iamuser.1",
  "arn:aws:iam::183631349910:user/system/iamuser.2",
]
users = [
  "iamuser.0",
  "iamuser.1",
  "iamuser.2",
]
*/