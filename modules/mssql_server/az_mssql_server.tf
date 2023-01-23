resource "azurerm_mssql_server" "adrian_sql_server" {
  # if the variable "mssql_server" is populated (is NOT null), 
  # it will create one occurence of this resource
  count                        = var.mssql_server == null ? 0 : 1
  name                         = var.mssql_server.name
  resource_group_name          = var.mssql_server.resource_group_name
  location                     = var.mssql_server.location
  version                      = var.mssql_server.version
  administrator_login          = var.mssql_server.administrator_login
  administrator_login_password = var.mssql_server.administrator_login_password

  # !!! search for purpose and usage it's used !!!
  # azuread_administrator {
  #   login_username = "AzureAD Admin"
  #   object_id      = "00000000-0000-0000-0000-000000000000"
  # }
}