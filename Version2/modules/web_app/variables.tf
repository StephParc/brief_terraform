variable "resource_group_name" {
  description = "Le nom du groupe de ressources"
  type        = string
}

variable "location" {
  description = "La localisation du groupe de ressources"
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