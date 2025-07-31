output "group_id" {
    description = "The ID of the Azure AD group"
    value = azuread_group.this.id
}

output "group_display_name" {
    description = "The display name of the Azure AD group"
    value = azuread_group.this.display_name
}
