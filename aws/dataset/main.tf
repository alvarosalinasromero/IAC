/*

different types of data types
type = list is used to create a list of values
type = set is used to create a set of values

*/
/*
variable "list" {
    type = list
    default = ["hello","world","hello"]
}
*/

output "mylist" {
  value = var.myset
}

variable "myset" {
  type = set(string)
  default = ["hello","world","hello"]
}