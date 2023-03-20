resource "azurerm_virtual_network" "amartinvn" {
  name                = "amartinvn"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.amartinrg.location
  resource_group_name = azurerm_resource_group.amartinrg.name

  tags = local.tags
}

resource "azurerm_subnet" "amartinsn" {
  name                 = "amartinsn"
  resource_group_name  = azurerm_resource_group.amartinrg.name
  virtual_network_name = azurerm_virtual_network.amartinvn.name
  address_prefixes     = ["10.0.2.0/24"]

}

resource "azurerm_network_interface" "amartinni" {
  name                = "amartinni"
  location            = azurerm_resource_group.amartinrg.location
  resource_group_name = azurerm_resource_group.amartinrg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.amartinsn.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.amartinip.id
  }

  tags = local.tags

}

resource "azurerm_public_ip" "amartinip" {
  name                = "amartinip"
  location            = azurerm_resource_group.amartinrg.location
  resource_group_name = azurerm_resource_group.amartinrg.name
  allocation_method   = "Dynamic"
}