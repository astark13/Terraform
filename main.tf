resource "azurerm_resource_group" "env_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "mssql_server" {
  for_each = { for mssql_server in var.mssql_server : mssql_server.name => mssql_server }
  source                       = "./modules"
  # loads the content of following block of code into the "mssql_server" variable
  mssql_server = each.value
  tags     = var.tags 
  depends_on = [
    azurerm_resource_group.env_rg
  ]
}

module "mssql_db" {
  for_each = { for mssql_db in var.mssql_db : mssql_db.name => mssql_db }
  source         = "./modules"
  mssql_db = each.value
  tags     = var.tags
  depends_on = [
    module.mssql_server
  ]
}
