#import {
#    to = azurerm_resource_group.ghan
#    id = "/subscriptions/d2c6c5f0-65c4-4d2d-9194-37994d21ef54/resourceGroups/RG-Ghan-Dev-Global-001"
#}

resource "azurerm_resource_group" "ghan" {
  name     = var.resourcegroup
  location = var.location
}

resource "azurerm_storage_account" "stg" {
  name                     = "linuxfunstgrg001"
  resource_group_name      = azurerm_resource_group.ghan.name
  location                 = azurerm_resource_group.ghan.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "appplan" {
  name                = "azure-functions-test-service-plan-001"
  location            = azurerm_resource_group.ghan.location
  resource_group_name = azurerm_resource_group.ghan.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "funcapp" {
  name                       = "test-azure-functions-001246"
  location                   = azurerm_resource_group.ghan.location
  resource_group_name        = azurerm_resource_group.ghan.name
  app_service_plan_id        = azurerm_app_service_plan.appplan.id
  storage_account_name       = azurerm_storage_account.stg.name
  storage_account_access_key = azurerm_storage_account.stg.primary_access_key
}