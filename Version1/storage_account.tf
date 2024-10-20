# Création du compte de stockage
resource "azurerm_storage_account" "my_storage_account" {
  name                     = "ststorageaccount"
  location                 = "northeurope"
  resource_group_name      = "de_p1_resource_group"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  depends_on = [azurerm_resource_group.rg]
}