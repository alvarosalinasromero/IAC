resource "azurerm_resource_group" "msg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    name = "MSG-${var.project}-${var.env}"
    Environment = var.env == "prod" ? "true" : "false"
  }
}