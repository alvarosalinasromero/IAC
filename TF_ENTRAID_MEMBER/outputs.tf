output "group_members" {
  description = "List of member object IDs added to the group"
  value       = [for member in azuread_group_member.this : member.member_object_id]
}