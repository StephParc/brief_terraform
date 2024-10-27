# Create virtual machine
resource "azurerm_virtual_machine" "vm" {
  name                  = var.vmname
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [var.nic_id]
  vm_size               = "Standard_DS1_v2"


  storage_os_disk {
    name              = var.storage_account_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  depends_on = [var.resource_group_dependency, var.storage_account_dependency, var.nic_dependancy]
}