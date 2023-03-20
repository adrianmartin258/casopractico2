resource "azurerm_container_registry" "amartincr" {
  name                = "amartincr"
  resource_group_name = azurerm_resource_group.amartinrg.name
  location            = azurerm_resource_group.amartinrg.location
  sku                 = "Basic"
  admin_enabled       = true

  tags = local.tags
}
