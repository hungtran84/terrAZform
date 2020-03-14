module "aks" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.rg.name
  #   client_id           = "your-service-principal-client-appid"
  #   client_secret       = "your-service-principal-client-password"
  prefix = "prefix"
}