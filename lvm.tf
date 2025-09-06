resource "azurerm_network_interface" "lb-lvm-nic1" {
  name                = "tf-lb-nic1"
  location            = azurerm_resource_group.lb-rg.location
  resource_group_name = azurerm_resource_group.lb-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.lb-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface" "lb-lvm-nic2" {
  name                = "tf-lb-nic2"
  location            = azurerm_resource_group.lb-rg.location
  resource_group_name = azurerm_resource_group.lb-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.lb-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "lb-vm1" {
  name                = "tflbvm1"
  resource_group_name = azurerm_resource_group.lb-rg.name
  location            = azurerm_resource_group.lb-rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "Iwant2learn2025"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.lb-lvm-nic1.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "lb-vm2" {
  name                = "tflbvm2"
  resource_group_name = azurerm_resource_group.lb-rg.name
  location            = azurerm_resource_group.lb-rg.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "Iwant2learn2025"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.lb-lvm-nic2.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
