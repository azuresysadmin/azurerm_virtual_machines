# Set the Azurerm provider with an empty features block
provider "azurerm" {
  features {}
}

# Set the required provider and the backends in the settings.tf file
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">3.4.0"
    }
  }

  # Set the remote backend
  backend "azurerm" {
    resource_group_name  = "" # Set the resource group that holds the remote backend
    storage_account_name = "" # Set the storage account that holds the remote backend 
    container_name       = "" # Set the container name for your remote backend
    key                  = "" # Set the name of the state file (and if you want, a directory "/dev/linuxvm/terraform.tfstate")
  }
}
