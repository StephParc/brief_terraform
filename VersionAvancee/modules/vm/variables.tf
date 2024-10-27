variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "La localisation du groupe de ressources"
  type        = string
}

variable "vmname" {
  description = "Nom de la VM"
  type        = string
}

variable "storage_account_name" {
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

variable "nic_id" {
  description = "Id du l'interface réseau"
  type        = string
}

variable "resource_group_dependency" {
  description = "Dépendance du groupe de ressources"
  type        = any
}

variable "storage_account_dependency" {
  description = "Dépendance du compte de stockage"
  type        = any
}

variable "nic_dependancy" {
  description = "Dépendance à l'interface réseau"
  type        = any
}