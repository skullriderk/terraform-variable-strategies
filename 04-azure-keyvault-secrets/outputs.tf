output "sql_server_name" {
  value = azurerm_mssql_server.sql.name
}

output "db_username" {
  value     = data.azurerm_key_vault_secret.db_username.value
  sensitive = true
}

output "db_password" {
  value     = data.azurerm_key_vault_secret.db_password.value
  sensitive = true
}