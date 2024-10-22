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
}