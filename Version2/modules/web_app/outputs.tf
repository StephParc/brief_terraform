output "app_service_plan_name" {
  value = azurerm_app_service_plan.app_service_plan.name
}

output "webapp_name" {
  value = azurerm_linux_web_app.app-service.name
}