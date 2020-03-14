module "aks" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.rg.name
  client_id           = var.client_id
  client_secret       = var.client_secret
  prefix              = "prefix"
}