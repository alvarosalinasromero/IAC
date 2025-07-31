# La autenticación se puede hacer por:
  # - Azure CLI (az login) - Recomendado para desarrollo local
  # - Service Principal - Para automatización/CI/CD

terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.47.0"
    }
  }
}