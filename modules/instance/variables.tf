variable "instance_name" {
  type        = string
  description = "El nombre de la instancia."
}

variable "ami" {
  type        = string
  description = "ID de la AMI para la instancia."
}

variable "instance_type" {
  type        = string
  description = "Tipo de la instancia."
}

variable "key_name" {
  type        = string
  description = "El nombre del par de llaves."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Lista de IDs de los grupos de seguridad."
}

variable "subnet_id" {
  type        = string
  description = "ID de la subred."
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Indica si se debe asociar una IP pública."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Etiquetas para la instancia."
}