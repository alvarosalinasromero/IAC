data "azuread_users" "members" {
  count                = length(var.entra_id_group_members_to_add) > 0 ? 1 : 0
  user_principal_names = var.entra_id_group_members_to_add
}

module "identidad_entra_id_group" {
  source = "../TF_ENTRAID_GROUP"

    entra_id_group_name                = var.entra_id_group_name
    entra_id_group_description         = var.entra_id_group_description
    entra_id_group_owner               = var.entra_id_group_owner
    entra_id_group_security_enabled    = var.entra_id_group_security_enabled
    entra_id_group_dynamic_membership_enabled = var.entra_id_group_dynamic_membership_enabled
    entra_id_group_dynamic_membership_rule   = var.entra_id_group_dynamic_membership_rule
}


module "identidad_entra_id_group_member" {
  source = "../TF_ENTRAID_MEMBER"

  entra_id_group_member_object_id = module.identidad_entra_id_group.group_id
  entra_id_group_members_to_add   = length(var.entra_id_group_members_to_add) > 0 ? data.azuread_users.members[0].object_ids : []

}
