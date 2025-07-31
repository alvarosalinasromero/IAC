output "group_id" {
    description = "The ID of the Azure AD group"
    value = module.identidad_entra_id_group.group_id
}

output "group_display_name" {
    description = "The display name of the Azure AD group"
    value = module.identidad_entra_id_group.group_display_name
}
