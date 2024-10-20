# Création d'un blob container
resource "azurerm_storage_container" "blob_container" {
  name                  = "mon-blob"
  storage_account_name  = "ststorageaccount"
  container_access_type = "private"
  depends_on = [azurerm_storage_account.my_storage_account]
}