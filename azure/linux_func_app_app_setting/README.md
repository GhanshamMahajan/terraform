# Terraform Azure Infrastructure Deployment

This repository contains Terraform configurations to deploy Azure resources, including a Resource Group, Storage Account, Service Plan, and a Linux Function App. Below is a detailed explanation of the resources and their configurations.

## Prerequisites

- **Terraform**: Ensure Terraform is installed on your machine. You can download it from [here](https://www.terraform.io/downloads.html).
- **Azure CLI**: Install the Azure CLI and authenticate with your Azure account. Follow the instructions [here](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
- **Azure Subscription**: Ensure you have an active Azure subscription.

---

## Terraform Configuration Files

### main.tf

This file defines the Azure resources to be deployed:

- **Resource Group**: `azurerm_resource_group.ghan`
- **Storage Account**: `azurerm_storage_account.stg`
- **Service Plan**: `azurerm_service_plan.appplan`
- **Linux Function App**: `azurerm_linux_function_app.linfuncapp`

### providers.tf

This file configures the Azure provider for Terraform:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}
```

### variable.tf

This file defines the variables used in the Terraform configuration:

```hcl
variable "resourcegroup" {
  type    = string
  default = "RG-Ghan-Dev-Global-001"
}

variable "location" {
  type    = string
  default = "West Europe"
}
```

---

## Deployment Instructions

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Review the Plan**:
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**:
   ```bash
   terraform apply
   ```

5. **Destroy Resources (Optional)**:
   If you want to delete the resources created by Terraform, run:
   ```bash
   terraform destroy
   ```

---

## Resource Details

### Resource Group

- **Name**: `RG-Ghan-Dev-Global-001` (default, can be overridden by the `resourcegroup` variable)
- **Location**: `West Europe` (default, can be overridden by the `location` variable)

### Storage Account

- **Name**: `linuxfunstgrg001`
- **Resource Group**: Same as the Resource Group defined above.
- **Location**: Same as the Resource Group defined above.
- **Account Tier**: `Standard`
- **Replication Type**: `LRS` (Locally Redundant Storage)

### Service Plan

- **Name**: `azure-functions-lin-test-service-plan-001`
- **Resource Group**: Same as the Resource Group defined above.
- **Location**: Same as the Resource Group defined above.
- **OS Type**: `Linux`
- **SKU**: `B1` (Basic Tier)

### Linux Function App

- **Name**: `test-azure-lin-functions-001246`
- **Resource Group**: Same as the Resource Group defined above.
- **Location**: Same as the Resource Group defined above.
- **Storage Account**: Uses the Storage Account defined above.
- **Service Plan**: Uses the Service Plan defined above.
- **HTTPS Only**: Enabled
- **FTP Basic Auth**: Enabled
- **SCM Basic Auth**: Enabled
- **Client Certificate Mode**: `Required`

---

## App Settings

The Linux Function App has the following app settings configured:

- **FUNCTIONS_WORKER_RUNTIME**: `python`
- **FUNCTIONS_EXTENSION_VERSION**: `~4`
- **PYTHON_ENABLE_DEBUG_LOGGING**: `true`
- **PYTHON_ENABLE_WORKER_EXTENSIONS**: `true`
- **PYTHON_THREADPOOL_THREAD_COUNT**: `2`

---

## Site Configuration

The Linux Function App has the following site configuration:

- **Python Version**: `3.9`
- **Always On**: `true`
- **FTPS State**: `FtpsOnly`
- **HTTP/2 Enabled**: `true`
- **Remote Debugging Enabled**: `true`
- **Minimum TLS Version**: `1.2`
- **Remote Debugging Version**: `VS2022`

---

## Notes

- Ensure that the Azure provider version (`4.1.0`) is compatible with the resources being deployed.
- The `depends_on` attribute ensures that resources are created in the correct order.
- The `app_settings` and `site_config` blocks are crucial for the proper functioning of the Linux Function App.

