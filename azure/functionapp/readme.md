# Terraform Azure Infrastructure

## Overview
This Terraform configuration provisions an Azure Resource Group and a Storage Account.

## Prerequisites
- Terraform installed
- Azure CLI authenticated
- An active Azure subscription

## Variables
| Variable         | Type   | Default Value                 |
|-----------------|--------|------------------------------|
| resourcegroup   | string | RG-Ghan-Dev-Global-001      |
| location        | string | West Europe                 |

## Deployment Steps
1. Initialize Terraform:
   ```sh
   terraform init
   ```
2. Validate the configuration:
   ```sh
   terraform validate
   ```
3. Plan the deployment:
   ```sh
   terraform plan
   ```
4. Apply the configuration:
   ```sh
   terraform apply -auto-approve
   ```

## Cleanup
To destroy the deployed resources, run:
```sh
terraform destroy -auto-approve
```

## Notes
- Ensure you have the required permissions to create resources in Azure.
- Modify the `variable.tf` file to change the resource group name or location as needed.

