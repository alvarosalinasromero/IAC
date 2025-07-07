
variable "ami" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0fab1b527ffa9b942"
}

variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "my-instance"
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "vpc_security_group_ids" {
  description = "VPC security group IDs"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the instance"
  type        = map(string)
  default     = {}
}
