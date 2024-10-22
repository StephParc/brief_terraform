# Création du compte de stockage
resource "azurerm_storage_account" "my_storage_account" {
  name                     = var.storage_account_name
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [var.resource_group_dependency]
}

# Création d'un blob container
resource "azurerm_storage_container" "blob_container" {
  name                  = var.blob_name
  storage_account_name  = azurerm_storage_account.my_storage_account.name
  container_access_type = "private"
  
  depends_on = [azurerm_storage_account.my_storage_account]
}
