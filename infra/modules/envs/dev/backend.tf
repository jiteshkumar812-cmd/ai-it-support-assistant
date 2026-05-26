terraform {
  backend "azurerm" {
    resource_group_name  = "rg-aiit-tfstate"
    storage_account_name = "staaiittfstate001"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
