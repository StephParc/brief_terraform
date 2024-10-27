variable "subscription_id" {
  description = "L'id de la souscription"
  type        = string
}

variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "La localisation du groupe de ressources"
  type        = string
}

variable "storage_account_name" {
  description = "Le nom du compte de storage"
  type        = string
}

variable "blob_name" {
  description = "Le nom du conteneur blob"
  type        = string
}

variable "virtual_network_name" {
  description = "Nom du réseau virtuel"
  type        = string
}

variable "vnet_address_space" {
  description = "Espace d'adressage du réseau"
  type        = list(string)
}

variable "subnet_name" {
  description = "Nom du sous-réseau"
  type        = string
}

variable "address_prefixes" {
  description = "Préfixe d'adresses"
  type        = list(string)
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

variable "app_service_plan_name" {
  description = "Nom du plan de service application"
  type        = string
}

variable "webapp_name" {
  description = "Nom de la webapp"
  type        = string
}

variable "vmname" {
  description = "Nom de la VM"
  type        = string
}

variable "storage_os_name" {
  description = "Nom du stockage de l'os disk"
  type        = string
}

variable "computer_name" {
  description = "Computer name"
  type        = string
}

variable "admin_username" {
  description = "Mom admin"
  type        = string
}

variable "admin_password" {
  description = "Mot de passe admin"
  type        = string
}