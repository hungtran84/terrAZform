terraform {
  backend "azurerm" {
    resource_group_name  = "tstate"
    storage_account_name = "tstate16436"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}