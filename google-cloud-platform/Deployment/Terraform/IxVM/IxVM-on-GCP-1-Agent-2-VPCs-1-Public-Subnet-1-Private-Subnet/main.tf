module "Agent1" {
	source = "armdupre/module-ixload-agent/google"
	version = "9.36.0"
	Eth0SubnetName = module.Vpc.PublicSubnet.name
	Eth0VpcNetworkName = module.Vpc.PublicVpcNetwork.name
	Eth1SubnetName = module.Vpc.PrivateSubnet.name
	Eth1VpcNetworkName = module.Vpc.PrivateVpcNetwork.name
	InstanceId = local.Agent1InstanceId
	MachineType = local.AgentMachineType
	RegionName = data.google_client_config.current.region
	UserEmailTag = local.UserEmailTag
	UserLoginTag = local.UserLoginTag
	UserProjectTag = local.UserProjectTag
	ZoneName = data.google_client_config.current.zone
	depends_on = [
		module.Vpc.PublicSubnet,
		module.Vpc.PublicVpcNetwork
	]
}