terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  // The provider will automatically use the subscription from your Azure CLI session.
  skip_provider_registration = true
  features {}
}