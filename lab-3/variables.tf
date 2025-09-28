variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "MSG-Alvaro"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "west europe"
}

variable "project"{
  description = "Project Name"
  type = string
  default = "Identidad"
}

variable "env" {
  description = "Environment"
  type = string
  default = "dev"
}