module "App" {
	source = "armdupre/module-ixload-app/azurerm"
	version = "9.36.0"
	AdminPassword = local.AppAdminPassword
	AdminUserName = local.AppAdminUserName
	Eth0SubnetId = module.Vnet.PublicSubnet.id
	ResourceGroupLocation = azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = azurerm_resource_group.ResourceGroup.name
	SshKeyName = azurerm_ssh_public_key.SshKey.name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	VmSize = local.AppVmSize
	depends_on = [
		module.Vnet
	]
}

module "Agent1" {
	source = "armdupre/module-ixload-agent/azurerm"
	version = "9.36.0"
	Eth0SubnetId = module.Vnet.PublicSubnet.id
	Eth1SubnetId = module.Vnet.PrivateSubnet.id
	InstanceId = local.Agent1InstanceId
	ResourceGroupLocation = azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = azurerm_resource_group.ResourceGroup.name
	SshKeyName = azurerm_ssh_public_key.SshKey.name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	VmSize = local.AgentVmSize
	depends_on = [
		module.App,
		module.Vnet
	]
}

resource "azurerm_resource_group" "ResourceGroup" {
	name = local.ResourceGroupName
	location = local.ResourceGroupLocation
}