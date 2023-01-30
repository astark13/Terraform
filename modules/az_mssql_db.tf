
# "data", queries Azure directly in this case,
# regardless if the resources were created or not by Terraform
data "azurerm_mssql_server" "mssql_server" {
    count          = var.mssql_db == null ? 0 : 1
    name = var.mssql_db.mssql_server_id.server_name
    resource_group_name = var.mssql_db.mssql_server_id.resource_group_name
 }

resource "azurerm_mssql_database" "mssql_db" {
  # if the variable "mssql_db" is populated (is NOT null), 
  # it will create one occurence of this resource
  count          = var.mssql_db == null ? 0 : 1
  name           = var.mssql_db.name
  server_id      = data.azurerm_mssql_server.mssql_server[0].id
  collation      = var.mssql_db.collation
  license_type   = var.mssql_db.license_type
  max_size_gb    = var.mssql_db.max_size_gb
  read_scale     = var.mssql_db.read_scale
  sku_name       = var.mssql_db.sku_name
  zone_redundant = var.mssql_db.zone_redundant
  tags           = var.tags
  depends_on = [
    data.azurerm_mssql_server.mssql_server
  ]
}
