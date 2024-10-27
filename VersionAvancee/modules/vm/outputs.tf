output "vmname" {
  value = azurerm_virtual_machine.vm.name
}

output "storage_os_name" {
  value = azurerm_virtual_machine.vm.storage_os_disk[0].name
}

output "computer_name" {
  value = [for profile in azurerm_virtual_machine.vm.os_profile : profile.computer_name if profile.computer_name != null][0]
}

output "admin_username" {
  value = [for profile in azurerm_virtual_machine.vm.os_profile : profile.admin_username if profile.admin_username != null][0]
}

output "password" {
  value = [for profile in azurerm_virtual_machine.vm.os_profile : profile.admin_password if profile.admin_password != null][0]
}