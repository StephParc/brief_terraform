# Création de la webapp
resource "azurerm_linux_web_app" "app-service" {
  name                = "my-beautifull-app"
  location            = "northeurope"
  resource_group_name = "de_p1_resource_group"
  service_plan_id     = azurerm_app_service_plan.app_service_plan.id

  site_config {
    # linux_fx_version = "DOCKER|mcr.microsoft.com/oss/nginx/nginx:1.15.5-alpine"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  depends_on = [azurerm_app_service_plan.app_service_plan]
}