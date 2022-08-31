terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.93.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "16c3cf4c-8ae4-4bb3-88d9-72933a271ded"
  client_id       = "4e9e1b9c-67a0-4a52-81f3-c3a9ab1b1dca"
  client_secret   = "Dsv8Q~PaLsfrL9.E1IXOTrT4EZw8mjBLiAxFvbsu"
  tenant_id       = "dcad0f12-9f1f-45b7-bb4e-6fbaaec1f08b"
  features {}
}

locals {
  resource_group="app-grp"
  location="North Europe"
}

resource "azurerm_resource_group" "app_grp"{
  name=local.resource_group
  location=local.location
}

resource "azurerm_virtual_network" "app_network" {
  name                = "app-network"
  location            = local.location
  resource_group_name = azurerm_resource_group.app_grp.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "SubnetA"
    address_prefix = "10.0.1.0/24"
  }  
}