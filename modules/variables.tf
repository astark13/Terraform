variable "mssql_server" {
  type = object({
    name                         = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
  })
  default = null
}

variable "mssql_db" {
  type = object({
    name           = string
    collation      = string
    license_type   = string
    max_size_gb    = string
    read_scale     = string
    sku_name       = string
    zone_redundant = string
    mssql_server_id = object({
      server_name         = string
      resource_group_name = string
    })
  })
  default = null 
}

variable "tags" {
  default = null
}