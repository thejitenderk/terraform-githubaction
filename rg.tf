terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "4.35.0"
        }
    }
}

provider "azurerm" {
  features {}
  subscription_id = "6427aa49-28ab-4afb-8e17-6f227b30229c"
}


resource "azurerm_resource_group" "lb-rg" {
  name     = "tf-lb-rg"
  location = "UK South"
}


# epic - 
# sprint (stand up) - biweekly 2 week - multiple eg team group of people work together
# user story - 1 person
#   story point -  2
# task - assigned each engineer - 1 person
# todo - in-progress - on-hold/review - done
