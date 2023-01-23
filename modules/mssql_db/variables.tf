variable "mssql_server" {
  type = object({
    server_name         = string
    resource_group_name = string
  })
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
  })
}

