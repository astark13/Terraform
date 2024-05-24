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

mssql_db = [{
  name           = "sqldb-weu-enot-dev-adi"
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 5
  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  mssql_server = {
    name         = "sql-weu-enot-dev-adi"
    resource_group_name = "rg-weu-enot-dev-adi"
  }
 } 
]

dashboard = [
  { name                 = "watea-gateway-data-collection-dev-adrian"
    resource_group       = "rg-watgw-watea-gateway-monitoring"
    location             = "westeurope"
    template_path        = "resources/watea_gateway_data_collection.tpl"
    dashboard_properties = {
      environment_type = "dev"
      location         = "westeurope"
      subscription_id  = "cc40dd1c-a034-4332-b88b-40d9131cb5db"
      project_name     = "watea-gateway"
      project_code     = "watgw"
    }
      # tags                = list(object({
      #   name = 
      # }))
  }
]
 
