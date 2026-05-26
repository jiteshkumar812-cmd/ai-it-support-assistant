terraform {
  required_version = ">= 1.7.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source   = "../../../modules/resource-group"
  name     = "rg-aiit-dev"
  location = var.location
  tags = {
    project     = "ai-it-support-assistant"
    environment = "dev"
  }
}

module "network" {
  source              = "../../../modules/network"
  resource_group_name = module.resource_group.name
  location            = var.location
  vnet_name           = "vnet-aiit-dev"
  address_space       = ["10.10.0.0/16"]
  subnets = {
    app = {
      name             = "snet-app"
      address_prefixes = ["10.10.1.0/24"]
    }
  }
  tags = {
    project     = "ai-it-support-assistant"
    environment = "dev"
  }
}

module "acr" {
  source              = "../../../modules/acr"
  name                = "acraiitdev001"
  resource_group_name = module.resource_group.name
  location            = var.location
  sku                 = "Standard"
  tags = {
    project     = "ai-it-support-assistant"
    environment = "dev"
  }
}

module "key_vault" {
  source                     = "../../../modules/key-vault"
  name                       = "kv-aiit-dev-001"
  resource_group_name        = module.resource_group.name
  location                   = var.location
  tenant_id                  = var.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 90
  purge_protection_enabled    = false
  tags = {
    project     = "ai-it-support-assistant"
    environment = "dev"
  }
}

module "aks" {
  source              = "../../../modules/aks"
  name                = "aks-aiit-dev"
  location            = var.location
  resource_group_name = module.resource_group.name
  dns_prefix          = "aks-aiit-dev"
  subnet_id           = module.network.subnet_ids["app"]
  acr_id              = module.acr.id
  kubernetes_version  = null
  node_count          = 1
  vm_size = "Standard_DS2_v2"

  tags = {
    project     = "ai-it-support-assistant"
    environment = "dev"
  }
}