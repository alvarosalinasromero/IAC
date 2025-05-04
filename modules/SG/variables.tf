
variable "name_sg" {
  type = string
  description = "Nombre del grupo de seguridad."
}
variable "description" {
  type = string
  description = "Descripción del grupo de seguridad."
}
variable "ingress_cidr_blocks" {
  type = list(string)
  description = "Lista de bloques CIDR para las reglas de entrada."
}
variable "egress_cidr_blocks" {
  type = list(string)
  description = "Lista de bloques CIDR para las reglas de salida."
}
variable "tags" {
  type = map(string)
  description = "Etiquetas para el grupo de seguridad."
}
variable "vpc_id" {
  type = string
  description = "ID de la VPC."
}
variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Reglas de entrada para el grupo de seguridad."
}
variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  description = "Reglas de salida para el grupo de seguridad."
}