# Azure Infrastructure Automation with Terraform

This repository contains a modular Terraform project designed to provision and manage a Virtual Machine and its associated networking resources in Microsoft Azure.

## 🏗️ Architecture & Structure

The repository is structured into two main components: `childmodule` (reusable resource modules) and `parentmodule` (the root execution environment).

### `childmodule` (Reusable Modules)
This directory contains individual, self-contained Terraform modules for various Azure resources:
- **`azurerm_resourcegroup`**: Provisions Azure Resource Groups.
- **`azurerm_virtual_network`**: Configures the Virtual Network (VNet).
- **`azurerm_subnet`**: Creates subnets within the VNet.
- **`azurerm_public_ip`**: Allocates Public IP addresses.
- **`azurerm_virtual_machine`**: Provisions the Azure Virtual Machine and connects it to the networking components.

### `parentmodule` (Root Environment)
This is the main Terraform execution directory. It consumes the modules defined in `childmodule` and orchestrates their deployment.
- **`main.tf`**: Invokes the child modules and handles resource dependencies (e.g., ensuring the Resource Group exists before creating the VNet).
- **`variable.tf` & `terraform.tfvars`**: Defines and assigns the configuration values and inputs for the environment.
- **`provider.tf`**: Configures the Azure provider (`azurerm`).

## 🚀 Prerequisites

Before you begin, ensure you have the following installed on your local machine:
- [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.0.0 or later)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

You must also be authenticated to your Azure account:
```bash
az login
```

## 🛠️ Usage / Deployment

To provision the infrastructure, execute the following commands:

1. **Navigate to the root module:**
   ```bash
   cd parentmodule
   ```

2. **Initialize Terraform:**
   Downloads the necessary providers and initializes the working directory.
   ```bash
   terraform init
   ```

3. **Review the execution plan:**
   Validates the configuration and shows what resources will be created.
   ```bash
   terraform plan
   ```

4. **Apply the configuration:**
   Provisions the resources in Azure. You will be prompted to confirm the action.
   ```bash
   terraform apply
   ```

## 🧹 Cleanup

To tear down the infrastructure and avoid incurring further Azure charges, run:
```bash
terraform destroy
```
