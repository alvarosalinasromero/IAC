variable "entra_id_group_member_object_id" {
  description = "The object ID of the Azure AD group to add members to"
  type        = string
}

variable "entra_id_group_members_to_add" {
  description = "List of object IDs of users to add to the group"
  type        = list(string)
  default     = []
}