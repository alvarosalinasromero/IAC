/*
trimspace removes leading and trailing whitespace
*/

variable "name" {
  default = "Terraform User "
}

output "formatted_name" {
  value = trimspace(var.name)
}

output "upper_name" {
  value = upper(var.name)
}

output "upper_name" {
  value = lower(var.name)
}

output "date" {
  value = formatdate("YYYY-MM-DD HH:mm:ss ZZZ", timestamp())
}

