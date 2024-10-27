module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "storage" {
  source                    = "./modules/storage"
  storage_account_name      = var.storage_account_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  blob_name                 = var.blob_name
  resource_group_dependency = module.resource_group
}

module "nets" {
  source                    = "./modules/nets"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.virtual_network_name
  vnet_address_space        = var.vnet_address_space
  subnet_name               = var.subnet_name
  address_prefixes          = var.address_prefixes
  nic_name                  = var.nic_name
  ip_config_name            = var.ip_config_name
  nsg_name                  = var.nsg_name
  resource_group_dependency = module.resource_group
}

module "web_app" {
  source                = "./modules/web_app"
  app_service_plan_name = var.app_service_plan_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  webapp_name           = var.webapp_name
  resource_group_dependency = module.resource_group
}
