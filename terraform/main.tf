terraform {
  required_version = ">=0.12"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "1.3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azapi" {}