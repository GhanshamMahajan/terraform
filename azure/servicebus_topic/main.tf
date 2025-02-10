module "resource_group" {
  source = "../modules/azure_rg"

  resource_group_name = var.resourcegroup
  location            = var.location
  tags = {
    environment = "dev"
    project     = "terraform-modules"
  }
}

resource "azurerm_servicebus_namespace" "servbus" {
  name                = var.azservbus
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}

resource "azurerm_servicebus_topic" "servbustopic" {
  name         = var.azservbustopic
  namespace_id = azurerm_servicebus_namespace.servbus.id
  max_size_in_megabytes = "5120"
  auto_delete_on_idle = "PT5M"
  partitioning_enabled = true
}