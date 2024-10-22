variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "La localisation du groupe de ressources"
  type        = string
}

variable "virtual_network_name" {
  description = "Nom du réseau virtuel"
  type        = string
}

variable "vnet_address_space" {
  description = "Espace d'adressage du réseau"
  type        = string
}

variable "subnet_name" {
  description = "Nom du sous-réseau"
  type        = string
}

variable "address_prefixes" {
  description = "Préfixe d'adresses"
  type        = string
}

variable "nic_name" {
  description = "Nom de l'interface réseau"
  type        = string
}

variable "ip_config_name" {
  description = "Nom de la configuration ip"
  type        = string
}

variable "nsg_name" {
  description = "Nom du groupe de sécurité réseau"
  type        = string
}