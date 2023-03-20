resource "azurerm_kubernetes_cluster" "amartincluster" {
  dns_prefix          = "amartinaks"
  name                = "amartin-aks"
  location            = azurerm_resource_group.amartinrg.location
  resource_group_name = azurerm_resource_group.amartinrg.name  

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  sensitive = true
  value     = azurerm_kubernetes_cluster.amartincluster.kube_config.0.client_certificate  
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.amartincluster.kube_config_raw

  sensitive = true
}