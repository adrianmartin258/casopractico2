resource "azurerm_linux_virtual_machine" "amartinvm" {
  name                = "amartinvm"
  resource_group_name = azurerm_resource_group.amartinrg.name
  location            = azurerm_resource_group.amartinrg.location
  size                = "Standard_B1ls"
  admin_username      = var.ssh_user
  network_interface_ids = [
    azurerm_network_interface.amartinni.id,
  ]

  admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  tags = local.tags

}
