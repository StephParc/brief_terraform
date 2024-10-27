output "storage_account_name" {
  value = azurerm_storage_account.my_storage_account.name
}

output "blob_name" {
  value = azurerm_storage_container.blob_container.name
}