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