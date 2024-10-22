# Création du plan de service app
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }

  depends_on = [azurerm_resource_group.rg]
}

# Création de la webapp
resource "azurerm_linux_web_app" "app-service" {
  name                = var.webapp_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_app_service_plan.app_service_plan.id

  site_config {
    # linux_fx_version = "DOCKER|mcr.microsoft.com/oss/nginx/nginx:1.15.5-alpine"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  depends_on = [azurerm_app_service_plan.app_service_plan]
}