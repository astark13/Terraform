output "server_id" {
   # since 'azurerm_mssql_server.adrian_sql_server' contains a 'count' field the '[*]' is needed for indexing
   value = join("",azurerm_mssql_server.adrian_sql_server[*].id)
}