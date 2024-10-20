# Création du groupe de ressources
resource "azurerm_resource_group" "rg" {
  location = "northeurope"
  name     = "de_p1_resource_group"
}

# Création du réseau virtuel
resource "azurerm_virtual_network" "vnet" {
  name                = "mon_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "northeurope"
  resource_group_name = "de_p1_resource_group"

  depends_on = [azurerm_resource_group.rg]
}

# Création du sous-réseau
resource "azurerm_subnet" "subnet" {
  name                 = "mon_subnet"
  resource_group_name  = "de_p1_resource_group"
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [azurerm_virtual_network.vnet]
}

# Création du plan de service app
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "de_p1_app_service_plan"
  location            = "northeurope"
  resource_group_name = "de_p1_resource_group"
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }

  depends_on = [azurerm_resource_group.rg]
}

# Création de l'interface réseau
resource "azurerm_network_interface" "nic" {
  name                = "parcollet_stephanie_nic"
  location            = "northeurope"
  resource_group_name = "de_p1_resource_group"

  ip_configuration {
    name                          = "de_p1_ip_config"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }

  depends_on = [azurerm_subnet.subnet]
}

# Création du group de sécurité
resource "azurerm_network_security_group" "nsg" {
  name                = "mon-nsg"
  location            = "northeurope"
  resource_group_name = "de_p1_resource_group"

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# # Création d'adresse publique IPs
# resource "azurerm_public_ip" "my_terraform_public_ip" {
#   name                = "myPublicIP"
#   location            = "northeurope"
#   resource_group_name = "de_p1_resource_group"
#   allocation_method   = "Dynamic"
# }



# # Connect the security group to the network interface
# resource "azurerm_network_interface_security_group_association" "ngs_nic" {
#   network_interface_id      = azurerm_network_interface.nic.id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }



