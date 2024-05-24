# !!! use if you have variables.tf and terraform.tfvars for main.tf
# resource "azurerm_portal_dashboard" "data_collection" {
#   count                = var.dashboard == null ? 0 : 1 
#   name                 = var.dashboard.name
#   resource_group_name  = var.dashboard.resource_group
#   location             = var.dashboard.location
#   dashboard_properties = templatefile(var.dashboard.template_path,var.dashboard.dashboard_properties)
#   #tags                 = var.dashboard.tags
# }

# !!! use if you provide variables in the module within main.tf
resource "azurerm_portal_dashboard" "data_collection" {
  for_each             = { for dashboard in var.dashboard : dashboard.name => dashboard} 
  name                 = each.value.name
  resource_group_name  = each.value.resource_group
  location             = each.value.location
  dashboard_properties = templatefile(each.value.template_path,each.value.dashboard_properties)
  #tags                 = var.dashboard.tags
}