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

# !!! use if you have variables.tf and terraform.tfvars for main.tf
# variable "dashboard" {
#   type = object({
#     name                 = string
#     resource_group       = string
#     location             = string
#     template_path        = string
#     dashboard_properties = object({
#       environment_type = string
#       location         = string
#       subscription_id  = string
#       project_name     = string
#       project_code     = string
#     })
#       # tags                = list(object({
#       #   name = 
#       # }))
#   })
#   default = null  
# }

# !!! use if you provide variables in the module within main.tf
variable "dashboard" {
  type = list(object({
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
  default = null  
}

variable "tags" {
  default = null
}