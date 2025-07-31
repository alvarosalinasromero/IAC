
data "azurerm_resource_group" "existing" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "new" {
  count    = var.create_resource_group == true ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}

locals {
  resource_group_name = var.create_resource_group ? azurerm_resource_group.new[0].name : data.azurerm_resource_group.existing[0].name
  location            = var.create_resource_group ? azurerm_resource_group.new[0].location : data.azurerm_resource_group.existing[0].location
}

module "storage_account" {
  source = "../TF_STORAGE_ACCOUNT"

  storage_account_name     = var.storage_account_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  https_traffic_only       = var.force_https
}

