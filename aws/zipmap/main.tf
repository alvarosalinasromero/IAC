
/*
write a ovierview of zipmap

zipmap is a data type in terraform that is used to create a map of keys and values.

zipmap its use to create a map of users and their arns
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

output "zipmap" {
  value = zipmap(aws_iam_user.name[*].name, aws_iam_user.name[*].arn)
}