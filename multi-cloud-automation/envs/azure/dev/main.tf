module "network" {
  source          = "../../modules/azure-network"
  resource_group_name = var.resource_group_name
  location        = var.location
  vnet_name       = var.vnet_name
  address_space   = var.address_space
  subnet_prefixes = var.subnet_prefixes
  tags            = var.tags
}

module "aks" {
  source              = "../../modules/azure-aks"
  cluster_name        = var.cluster_name
  location            = var.location
  resource_group_name = module.network.resource_group
  subnet_id           = element(module.network.subnet_ids, 0)
  tags                = var.tags
}
