
module "grupo1" {
  source = "../SC_ENTRAID_GROUP"  # ← Ruta correcta desde TEST/

  entra_id_group_name = "Z0grupotestnoowner1"
  entra_id_group_description = "Grupo de prueba"
  entra_id_group_security_enabled = true
  entra_id_group_dynamic_membership_enabled = true
  entra_id_group_dynamic_membership_rule = "alvaro.example.com -eq '@example-com'"
  
  # entra_id_group_members_to_add = [
  #   "johndoe@labcostosogmail.onmicrosoft.com"
  # ]
}

# module "storagealvaro" {
#   source = "../SC_STORAGE"

#   #create_resource_group = true
#   resource_group_name   = "production"
#   location              = "West Europe"
#   storage_account_name  = "alvarostorageacct"
  
# }