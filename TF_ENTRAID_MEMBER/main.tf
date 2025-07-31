
resource "azuread_group_member" "this" {
  for_each = toset(var.entra_id_group_members_to_add)
  
  group_object_id  = var.entra_id_group_member_object_id
  member_object_id = each.value
}