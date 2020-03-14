terraform {
  backend "azurerm" {
    resource_group_name   = "tstate"
    storage_account_name  = "tstate20102"
    container_name        = "tstate"
    key                   = "terraform.tfstate"
  }
}