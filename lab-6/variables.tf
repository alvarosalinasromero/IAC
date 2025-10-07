variable "password" {
  type = string
  sensitive = true
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "bucket_name" {
  type    = string
}