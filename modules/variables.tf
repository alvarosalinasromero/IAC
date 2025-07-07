

variable "ami" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0fab1b527ffa9b942"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {}
}
