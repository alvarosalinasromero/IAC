variable "entra_id_group_name" {
  description = "The name of the Azure AD group"
  type        = string
}

variable "entra_id_group_description" {
  description = "The description of the Azure AD group"
  type        = string
  default     = ""
}

variable "entra_id_group_security_enabled" {
  description = "Whether the Azure AD group is security enabled"
  type        = bool
  default     = true
}

variable "entra_id_group_owner" {
  description = "Owner of the Azure AD group"
  type        = list(string)
  default     = null
}

# Variable para añadir miembros
variable "entra_id_group_members_to_add" {
  description = "List of object IDs of users to add to the group"
  type        = list(string)
  default     = []
}

variable "entra_id_group_dynamic_membership_rule" {
  description = "Dynamic membership rule for the group (leave empty to disable)"
  type        = string
  default     = ""
}

variable "entra_id_group_dynamic_membership_enabled" {
  description = "Whether dynamic membership is enabled"
  type        = bool
  default     = true
}

