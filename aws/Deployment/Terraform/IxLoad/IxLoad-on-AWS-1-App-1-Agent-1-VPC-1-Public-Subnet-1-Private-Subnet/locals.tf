locals {
	AgentInstanceType = var.AgentInstanceType
	Agent1InstanceId = "agent1"
	AppInstanceType = var.AppInstanceType
	AppSshKeyName = var.AppSshKeyName
	AppTag = "ixload"
	AppVersion = "9-36"
	InboundIPv4CidrBlock = var.InboundIPv4CidrBlock
	PlacementGroupName = "${local.Preamble}-placement-group-${local.Region}"
	PlacementGroupStrategy = "cluster"
	Preamble = "${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}-${local.AppVersion}"
	PrivateSubnetAvailabilityZone = var.PrivateSubnetAvailabilityZone
	PublicSubnetAvailabilityZone = var.PublicSubnetAvailabilityZone
	Region = data.aws_region.current.name
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	UserProjectTag = var.UserProjectTag
}