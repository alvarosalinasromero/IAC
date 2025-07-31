
resource "azurerm_storage_account" "this" {

  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  // Condicion var.https_traffic_only != null
  // Si es null, usa el valor por defecto (true)
  // Si no es null (false), usa el valor proporcionado
  #https_traffic_only_enabled = var.https_traffic_only != null ? var.https_traffic_only : true
  https_traffic_only_enabled = var.https_traffic_only == null ? true : var.https_traffic_only

  tags = {
    environment = "production"
    project     = "my-project"
  }
}
