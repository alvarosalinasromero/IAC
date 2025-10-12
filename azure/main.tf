// Block to specify the required Terraform version and providers
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

// Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

variable "location" {
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  type        = string
  default     = "terraform"
}

resource "azurerm_resource_group" "rsg1" {
    name     = var.resource_group_name
    location = var.location
//tags dynamicos
    tags = {
      environment = "Terraform Demo"
    }
}

resource "azurerm_storage_account" "sta1" {
    name                     = lower("st${var.resource_group_name}")
    resource_group_name      = azurerm_resource_group.rsg1.name
    location                 = azurerm_resource_group.rsg1.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}

output "storage_blob_endpoint" {
  value = azurerm_storage_account.sta1.primary_blob_endpoint
}