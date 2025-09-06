resource "azurerm_lb" "lb-first" {
  name                = "TestLoadBalancer"
  location            = azurerm_resource_group.lb-rg.location
  resource_group_name = azurerm_resource_group.lb-rg.name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.lbfrontend.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb-backend-pool" {
  loadbalancer_id = azurerm_lb.lb-first.id
  name            = "BackEndAddressPool"
}


resource "azurerm_lb_rule" "lb-rule" {
  loadbalancer_id                = azurerm_lb.lb-first.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
}


resource "azurerm_lb_probe" "lb-probe" {
  loadbalancer_id = azurerm_lb.lb-first.id
  name            = "http-running-probe"
  port            = 80
}