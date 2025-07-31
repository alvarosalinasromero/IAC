resource "azuread_group" "this" {
  display_name     = var.entra_id_group_name
  description      = var.entra_id_group_description
  #owners           = length(trimspace(var.entra_id_group_owner)) > 0 ? [var.entra_id_group_owner] : null
  #owners           = local.has_owner ? [var.entra_id_group_owner] : null
  owners           = local.owners_arg
  security_enabled = var.entra_id_group_security_enabled
  mail_nickname    = var.entra_id_group_name

  dynamic "dynamic_membership" {
    for_each = length(trimspace(var.entra_id_group_dynamic_membership_rule)) > 0 ? [1] : []

    content {
      enabled = var.entra_id_group_dynamic_membership_enabled
      rule    = var.entra_id_group_dynamic_membership_rule
    } 
  }
}

# locals {
#   has_owner = length(trimspace(var.entra_id_group_owner)) > 0
# }

locals {
  owners_arg = var.entra_id_group_owner == null ? null : toset(var.entra_id_group_owner)
}