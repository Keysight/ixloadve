module "App" {
	source = "git::https://github.com/armdupre/terraform-azurerm-module-ixload-app.git?ref=10.40.0"
	AdminPassword = local.AppAdminPassword
	AdminUserName = local.AppAdminUserName
	Eth0SubnetId = module.Vnet.PublicSubnet.id
	ResourceGroupLocation = azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = azurerm_resource_group.ResourceGroup.name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	VmSize = local.AppVmSize
	depends_on = [
		module.Vnet
	]
}

module "Agent1" {
	source = "git::https://github.com/armdupre/terraform-azurerm-module-ixload-agent.git?ref=10.40.0"
	Eth0SubnetId = module.Vnet.PublicSubnet.id
	Eth1SubnetId = module.Vnet.Private1Subnet.id
	InstanceId = local.Agent1InstanceId
	ResourceGroupLocation = azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = azurerm_resource_group.ResourceGroup.name
	SshKeyName = azurerm_ssh_public_key.SshKey.name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	VmSize = local.AgentVmSize
	depends_on = [
		azurerm_ssh_public_key.SshKey,
		module.App,
		module.Vnet
	]
}

module "Agent2" {
	source = "git::https://github.com/armdupre/terraform-azurerm-module-ixload-agent.git?ref=10.40.0"
	Eth0IpAddress = local.Agent2Eth0IpAddress
	Eth0SubnetId = module.Vnet.PublicSubnet.id
	Eth1IpAddresses = local.Agent2Eth1IpAddresses
	Eth1SubnetId = module.Vnet.Private2Subnet.id
	InstanceId = local.Agent2InstanceId
	ResourceGroupLocation = azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = azurerm_resource_group.ResourceGroup.name
	SshKeyName = azurerm_ssh_public_key.SshKey.name
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	VmSize = local.AgentVmSize
	depends_on = [
		azurerm_ssh_public_key.SshKey,
		module.App,
		module.Vnet
	]
}

resource "azurerm_resource_group" "ResourceGroup" {
	name = local.ResourceGroupName
	location = local.ResourceGroupLocation
}

resource "random_id" "RandomId" {
	byte_length = 4
}