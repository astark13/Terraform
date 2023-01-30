location            = "West Europe"
resource_group_name = "rg-weu-enot-dev-adi"
tags = {
  "Environment" = "dev",
  "Project"     = "ENOT"
}

mssql_server = [{
  name                         = "sql-weu-enot-dev-adi"
  resource_group_name          = "rg-weu-enot-dev-adi"
  location                     = "West Europe"
  version                      = "12.0"
  administrator_login          = "sql_admin"
  administrator_login_password = "pass1234$"
  }
] 

mssql_server_id = {
  server_name         = "sql-weu-enot-dev-adi"
  resource_group_name = "rg-weu-enot-dev-adi"
}

mssql_db = [{
  name           = "sqldb-weu-enot-dev-adi"
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 5
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  mssql_server_id = {
    server_name         = "sql-weu-enot-dev-adi"
    resource_group_name = "rg-weu-enot-dev-adi"
  }
 } 
]
 
