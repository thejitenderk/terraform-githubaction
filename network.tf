resource "azurerm_virtual_network" "lb-vnet" {
  name                = "tf-lb-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.lb-rg.location
  resource_group_name = azurerm_resource_group.lb-rg.name
}

resource "azurerm_subnet" "lb-subnet" {
  name                 = "tf-lb-subnet"
  resource_group_name  = azurerm_resource_group.lb-rg.name
  virtual_network_name = azurerm_virtual_network.lb-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "lbfrontend" {
  name                = "PublicIPForLB"
  location            = azurerm_resource_group.lb-rg.location
  resource_group_name = azurerm_resource_group.lb-rg.name
  allocation_method   = "Static"
}