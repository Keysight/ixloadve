locals {
	AgentMachineType = var.AgentMachineType
	Agent1InstanceId = "agent1"
	Agent2Eth0PrivateIpAddress = "10.0.10.12"
	Agent2Eth0PublicIpAddressName = "${local.Preamble}-eth0-ip-addr"
	Agent2Eth1PrivateIpAddress = "10.0.2.116"
	Agent2Eth1PrivateIpAliases = "/28"
	Agent2InstanceId = "agent2"
	Agent2InstanceName = "${local.Preamble}-instance"
	AppMachineType = var.AppMachineType
	AppTag = "ixload"
	Preamble = replace("${local.UserLoginTag}-${local.UserProjectTag}-${local.AppTag}-${local.Agent2InstanceId}", "_", "-")
	PublicFirewallRuleSourceIpRanges = var.PublicFirewallRuleSourceIpRanges == null ? [ "${data.http.ip.response_body}/32" ] : var.PublicFirewallRuleSourceIpRanges
	UserEmailTag = var.UserEmailTag == null ? data.google_client_openid_userinfo.current.email : var.UserEmailTag
	UserLoginTag = var.UserLoginTag == null ? "terraform" : var.UserLoginTag
	UserProjectTag = var.UserProjectTag == null ? lower(random_id.RandomId.id) : var.UserProjectTag
}