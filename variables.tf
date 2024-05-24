variable "location" {
}

variable "resource_group_name" {
}

variable "tags" {
  type = map(string)
}

variable "mssql_server" {
  type = list (
    object({
      name                         = string
      resource_group_name          = string
      location                     = string
      version                      = string
      administrator_login          = string
      administrator_login_password = string
    })
  )
}

# variable needed to extract de server_id
variable "mssql_server_id" {
  type = object({
    server_name         = string
    resource_group_name = string
  })
}

variable "mssql_db" {
  type = list (
    object({
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
  )
}

variable "dashboard" {
  type = list(
    object({
      name                 = string
      resource_group       = string
      location             = string
      template_path        = string
      dashboard_properties = object({
        environment_type = string
        location         = string
        subscription_id  = string
        project_name     = string
        project_code     = string
      })
      # tags                = list(object({
      #   name = 
      # }))
    })
  )
}