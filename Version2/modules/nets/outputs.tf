output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

# output "vnet_location" {
#   value = azurerm_virtual_network.vnet.location
# }

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "vnet_rg_name" {
  value = azurerm_virtual_network.vnet.resource_group_name.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "nic_name" {
  value = azurerm_network_interface.nic.name
}

output "ip_config_name" {
  value = azurerm_network_interface.nic.ip_configuration[0].name
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}

