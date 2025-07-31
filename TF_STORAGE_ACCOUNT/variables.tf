
variable "storage_account_name" {
  type        = string
  description = "Nombre de la cuenta de almacenamiento"

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "El nombre debe tener entre 3-24 caracteres, solo minúsculas y números."
  }
}

variable "resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos"

  validation {
    condition     = length(var.resource_group_name) >= 1 && length(var.resource_group_name) <= 90
    error_message = "El nombre del RG debe tener entre 1 y 90 caracteres."
  }
}

variable "location" {
  type        = string
  description = "Ubicación de la cuenta de almacenamiento"
  default     = "West Europe"
}

variable "account_tier" {
  type        = string
  description = "Nivel de la cuenta de almacenamiento"
  default     = "Standard"
    validation {
        condition     = contains(["Standard", "Premium"], var.account_tier)
        error_message = "El nivel de la cuenta debe ser 'Standard' o 'Premium'."
    }
}

variable "account_replication_type" {
  type        = string
  description = "Tipo de replicación de la cuenta de almacenamiento"
  default     = "GRS"  # Geo-Redundant Storage
}

variable "https_traffic_only" {
  type        = bool
  description = "Habilitar solo tráfico HTTPS"
  default     = null
}

variable "tags" {
  type = map(string)
  default = {}
  
  validation {
    condition = alltrue([
      for tag_key, tag_value in var.tags : 
      length(tag_key) <= 128 && length(tag_value) <= 256
    ])
    error_message = "Los tags no pueden superar 128 caracteres en la clave y 256 en el valor."
  }
}