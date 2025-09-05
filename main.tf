terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6427aa49-28ab-4afb-8e17-6f227b30229c"
}

resource "azurerm_resource_group" "tf-test" {
  name     = "tf-test"
  location = "UK South"
}

resource "azurerm_resource_group" "tf-demo" {
  name     = "tf-demo"
  location = "UK South"
}
