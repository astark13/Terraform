resource "azurerm_resource_group" "adrian_rg" {
  name     = "rg-weu-enot-dev-adrian"
  location = "West Europe"
}

module "mssql_server" {
  source                       = "./modules/mssql_server"
  # loads the content of following block of code into the "mssql_server" variable
  mssql_server = {
    administrator_login = "sql_admin"
    administrator_login_password = "pass1234$"
    location = "West Europe"
    name = "sql-weu-enot-dev-adrian"
    resource_group_name = "rg-weu-enot-dev-adrian"
    version = "12.0"
  }
    
  depends_on = [
    azurerm_resource_group.adrian_rg
  ]
}

module "mssql_db" {
  source         = "./modules/mssql_db"
  mssql_server ={
    server_name = "sql-weu-enot-dev-adrian"
    resource_group_name = "rg-weu-enot-dev-adrian"
  }
  mssql_db = {
    name           = "sqldb-weu-enot-dev-adrian"
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    license_type   = "LicenseIncluded"
    max_size_gb    = 5
    read_scale     = false
    sku_name       = "S0"
    zone_redundant = false
  }

  depends_on = [
    module.mssql_server
  ]
}
