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

resource "azurerm_service_plan" "appplan" {
  name                = "azure-functions-lin-test-service-plan-001"
  resource_group_name = azurerm_resource_group.ghan.name
  location            = azurerm_resource_group.ghan.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_function_app" "linfuncapp" {
  name                = "test-azure-lin-functions-001246"
  resource_group_name = azurerm_resource_group.ghan.name
  location            = azurerm_resource_group.ghan.location
  storage_account_name       = azurerm_storage_account.stg.name
  storage_account_access_key = azurerm_storage_account.stg.primary_access_key
  service_plan_id            = azurerm_service_plan.appplan.id
  https_only = "true" #HTTPS Only
  ftp_publish_basic_authentication_enabled = "true" # FTP Basic Auth Publishing Credentials
  webdeploy_publish_basic_authentication_enabled = "true" # SCM Basic Auth Publishing Credentials
  client_certificate_mode = "Required" #Client certificate mode


  site_config {
    application_stack {
      python_version = "3.9"
    }
    always_on = "true" #FTP state
    ftps_state = "FtpsOnly" #FTP state
    http2_enabled = "true" # HTTP 2.0 Proxy
    remote_debugging_enabled = "true"  #Remote debugging
    minimum_tls_version = "1.2"   #Minimum Inbound TLS Version
    remote_debugging_version = "VS2022"
  }
}