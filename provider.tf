provider "azurerm" {
    features {}
    skip_provider_registration = true
    # client_id = var.client_id
    # client_secret = var.client_secret
    # tenant_id = var.tenant_id
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
}

variable "client_id" {
  description = "Azure Service Principal Client ID"
}

variable "tenant_id" {
  description = "Azure Tenant ID"
}