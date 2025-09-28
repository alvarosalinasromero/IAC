variable "availability_zone" {
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  description = "AZ"
}

variable "public_subnet_cidrs" {
  description = "subnet publics"
  type        = list(string)
  default     = ["10.50.0.0/24", "10.50.1.0/24", "10.50.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "subnet privates"
  type        = list(string)
  default     = ["10.50.8.0/24", "10.50.9.0/24", "10.50.10.0/24"]
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnets" {
  default = {
    "private_subnet_1" = 0
    "private_subnet_2" = 1
    "private_subnet_3" = 2
  }
}

variable "public_subnets" {
  default = {
    "public_subnet_1" = 0
    "public_subnet_2" = 1
    "public_subnet_3" = 2
  }
}
