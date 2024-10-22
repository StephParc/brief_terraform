variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "La localisation du groupe de ressources"
  type        = string
}

variable "vm_name" {
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