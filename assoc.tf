resource "azurerm_network_interface_backend_address_pool_association" "lb-nic-assoc1" {
  network_interface_id    = azurerm_network_interface.lb-lvm-nic1.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb-backend-pool.id
}

resource "azurerm_network_interface_backend_address_pool_association" "lb-nic-assoc2" {
  network_interface_id    = azurerm_network_interface.lb-lvm-nic2.id
  ip_configuration_name   = "testconfiguration1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb-backend-pool.id
}