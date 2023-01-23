# output "server_id" {
#   value = module.mssql_server.server_id
# }

# output "server_id_from_data" {
#    # since 'azurerm_mssql_server.adrian_sql_server' contains a 'count' field the '[*]' is needed for indexing
#    value = data.azurerm_mssql_server.adrian_mssql_server.id
# }