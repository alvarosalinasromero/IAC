variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnet" {
    type = map(object({
    az = string
    cidr = number
}))
    default = {
        private_subnet_1 = { az = "eu-west-1a", cidr = 0 }
        private_subnet_2 = { az = "eu-west-1b", cidr = 1 }
        private_subnet_3 = { az = "eu-west-1c", cidr = 2 }
    }
}

variable "public_subnets" {
  description = "Subnets públicas: az + índice para cidrsubnet"
  type = map(object({
    az         = string
    cidr_index = number
  }))
  default = {
    public-a = { az = "eu-west-1a", cidr_index = 3 }
    public-b = { az = "eu-west-1b", cidr_index = 4 }
    public-c = { az = "eu-west-1c", cidr_index = 5 }
  }
}

variable "env" {
  description = "Environment"
  type = string
  default = "dev"
}

variable "project"{
  description = "Project Name"
  type = string
  default = "Identidad"
}

variable "location"{
  description = "Location"
  type = string
  default = "eu-west-1a"
}