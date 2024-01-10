module "Vnet" {
	source = "armdupre/module-1-vnet-1-public-subnet-2-private-subnets/azurerm"
	version = "0.1.1"
	PublicSecurityRuleSourceIpPrefixes = local.PublicSecurityRuleSourceIpPrefixes
	ResourceGroupLocation = azurerm_resource_group.ResourceGroup.location
	ResourceGroupName = azurerm_resource_group.ResourceGroup.name
	Tag = local.AppTag
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	Version = local.AppVersion
}