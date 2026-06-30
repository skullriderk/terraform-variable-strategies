terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Read existing Key Vault
data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

# Read DB Username
data "azurerm_key_vault_secret" "db_username" {
  name         = "db-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

# Read DB Password
data "azurerm_key_vault_secret" "db_password" {
  name         = "db-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}

# Create SQL Server
resource "azurerm_mssql_server" "sql" {

  name                         = "kkrsqlserver2026063025demo"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"

  administrator_login          = data.azurerm_key_vault_secret.db_username.value
  administrator_login_password = data.azurerm_key_vault_secret.db_password.value
}