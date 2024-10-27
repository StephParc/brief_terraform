output "vm_name" {
  value = azurerm_virtual_machine.vm.name
}

output "storage_os_name" {
  value = azurerm_virtual_machine.vm.storage_os_disk[0].name
}

output "computer_name" {
  value = azurerm_virtual_machine.vm.os_profile[2].computer_name
}

output "admin_username" {
  value = azurerm_virtual_machine.vm.os_profile[2].admin_username
}

output "password" {
  value = azurerm_virtual_machine.vm.os_profile[2].admin_password
}