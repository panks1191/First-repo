module "azurerm_resource_group" {
  source   = "../childmodule/azurerm_resourcegroup"
  rg_names = var.rg_names

}
module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../childmodule/azurerm_virtual_network"
  vnets      = var.vnets
}
module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../childmodule/azurerm_subnet"
  subnets    = var.subnets
}
module "azurerm_public_ip" {
  depends_on = [ module.azurerm_resource_group ]
  source = "../childmodule/azurerm_public_ip"
  public_ips = var.public_ips
}
module "azurerm_virtual_machine" {
  depends_on = [ module.azurerm_subnet,module.azurerm_resource_group ]
  source = "../childmodule/azurerm_virtual_machine"
  vms = var.vms
}