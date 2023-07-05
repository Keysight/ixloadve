provider "aws" {
	region = var.Region
}

locals {
	uuid = substr(uuid(), 1, 6)
	Region = var.Region
	UserEmailTag = var.UserEmailTag
	UserLoginTag = var.UserLoginTag
	IxClientSSHKey = var.IxClientSSHKey
	TestApplianceInstanceType = var.TestApplianceInstanceType
	InboundIPv4CidrBlock = var.InboundIPv4CidrBlock
	AMIxTESTAPPLIANCE = {
		us-east-1 = "ami-0a7bf3ec50a3a4729"
		us-east-2 = "ami-04d1b033e5899d1dd"
		us-west-1 = "ami-05dcdef2ecec999fb"
		us-west-2 = "ami-0cbaecff38c270872"
		ap-south-1 = "ami-04cf6fcbea7b1cbb4"
		ap-northeast-2 = "ami-06b54462feb8b554f"
		ap-southeast-1 = "ami-0813b566841ed9c50"
		ap-southeast-2 = "ami-0a6ea135e52a5a461"
		ap-northeast-1 = "ami-08c9336def5c6b38b"
		ca-central-1 = "ami-0b4bf304b554b0bea"
		eu-central-1 = "ami-0f7d272bb1c32395c"
		eu-west-1 = "ami-0dc58923532503bf6"
		eu-west-2 = "ami-04bfd95471edbb4f3"
		eu-west-3 = "ami-0a54aa3d45450f274"
		eu-north-1 = "ami-0e7f05fcff4cc2535"
		sa-east-1 = "ami-09a265bf435321da3"
	}
	EC2xCONNECTxCIDR = {
		us-east-1 = "18.206.107.24/29"
		us-east-2 = "3.16.146.0/29"
		us-west-1 = "13.52.6.112/29"
		us-west-2 = "18.237.140.160/29"
		ap-south-1 = "13.233.177.0/29"
		ap-northeast-2 = "13.209.1.56/29"
		ap-southeast-1 = "3.0.5.32/29"
		ap-southeast-2 = "13.239.158.0/29"
		ap-northeast-1 = "3.112.23.0/29"
		ca-central-1 = "35.183.92.176/29"
		eu-central-1 = "3.120.181.40/29"
		eu-west-1 = "18.202.216.48/29"
		eu-west-2 = "3.8.37.24/29"
		eu-west-3 = "35.180.112.80/29"
		eu-north-1 = "13.48.4.200/30"
		sa-east-1 = "13.48.4.200/30"
	}
	EC2xREGION = {
		us-east-1 = "US East (N. Virginia)"
		us-east-2 = "US East (Ohio)"
		us-west-1 = "US West (N. California)"
		us-west-2 = "US West (Oregon)"
		ap-northeast-2 = "Asia Pacific (Seoul)"
		ap-southeast-1 = "Asia Pacific (Singapore)"
		ap-southeast-2 = "Asia Pacific (Sydney)"
		ap-northeast-1 = "Asia Pacific (Tokyo)"
		ca-central-1 = "Canada (Central)"
		eu-central-1 = "EU (Frankfurt)"
		eu-west-1 = "EU (Ireland)"
		eu-west-2 = "EU (London)"
		eu-west-3 = "EU (Paris)"
		eu-north-1 = "EU (Stockholm)"
		sa-east-1 = "South America (Sao Paulo)"
	}
	REGIONxTAG = {
		us-east-1 = "US_EAST_1"
		us-east-2 = "US_EAST_2"
		us-west-1 = "US_WEST_1"
		us-west-2 = "US_WEST_2"
		ap-northeast-2 = "AP_NORTHEAST_2"
		ap-southeast-1 = "AP_SOUTHEAST_1"
		ap-southeast-2 = "AP_SOUTHEAST_2"
		ap-northeast-1 = "AP_NORTHEAST_1"
		ca-central-1 = "CA_CENTRAL_1"
		eu-central-1 = "EU_CENTRAL_1"
		eu-west-1 = "EU_WEST_1"
		eu-west-2 = "EU_WEST_2"
		eu-west-3 = "EU_WEST_3"
		eu-north-1 = "EU_NORTH_1"
		sa-east-1 = "SA_EAST_1"
	}
	OPTIONSxTAG = "MANUAL"
	PROJECTxTAG = "OPEN"
	VPCxCIDRxBLOCK = "10.0.0.0/16"
	VPCxINSTANCExTENANCY = "default"
	VPCxENABLExDNSxSUPPORT = true
	VPCxENABLExDNSxHOSTNAMES = true
	PLACEMENTxGROUPxSTRATEGY = "cluster"
	FLOWxLOGxTRAFFICxTYPE = "REJECT"
	SUBNETxAVAILABILITYxZONExINDEX = "0"
	MGMTxSUBNETxCIDRxBLOCK = "10.0.10.0/24"
	TEST1xSUBNETxCIDRxBLOCK = "10.0.2.0/24"
	TEST2xSUBNETxCIDRxBLOCK = "10.0.3.0/24"
	INTERFACExSOURCExDESTxCHECK = false
	INSTANCExDISABLExAPIxTERMINATION = false
	INSTANCExMONITORING = false
	INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR = "stop"
	INSTANCExBLOCKxDEVICExNAME = "/dev/sda1"
	INSTANCExEBSxDELETExONxTERMINATION = true
	INSTANCExEBSxVOLUMExTYPE = "gp2"
	APPxTAG = "KEYSIGHT"
	APPxVERSION = "9.20"
	TESTAPPLIANCE1xETH0xPRIVATExIPxADDRESS = "10.0.10.11"
	TESTAPPLIANCE1xETH1xPRIVATExIPxADDRESSES = [ "10.0.2.12", "10.0.2.13", "10.0.2.14", "10.0.2.15", "10.0.2.16", "10.0.2.17", "10.0.2.18", "10.0.2.19", "10.0.2.20", "10.0.2.21" ]
	TESTAPPLIANCE2xETH0xPRIVATExIPxADDRESS = "10.0.10.12"
	TESTAPPLIANCE2xETH1xPRIVATExIPxADDRESSES = [ "10.0.3.12", "10.0.3.13", "10.0.3.14", "10.0.3.15", "10.0.3.16", "10.0.3.17", "10.0.3.18", "10.0.3.19", "10.0.3.20", "10.0.3.21" ]
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_placement_group" "PlacementGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_PLACEMENT_GROUP_${local.uuid}_${local.REGIONxTAG["${local.Region}"]}"
	strategy = local.PLACEMENTxGROUPxSTRATEGY
}

resource "aws_vpc" "Vpc" {
	cidr_block = local.VPCxCIDRxBLOCK
	instance_tenancy = local.VPCxINSTANCExTENANCY
	enable_dns_support = local.VPCxENABLExDNSxSUPPORT
	enable_dns_hostnames = local.VPCxENABLExDNSxHOSTNAMES
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_VPC_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_flow_log" "VpcFlowLog" {
	log_destination =  aws_cloudwatch_log_group.VpcFlowLogGroup.arn
	iam_role_arn = aws_iam_role.VPCFlowLogAccessRole.arn
	vpc_id = aws_vpc.Vpc.id
	traffic_type = local.FLOWxLOGxTRAFFICxTYPE
}

resource "aws_iam_role" "VPCFlowLogAccessRole" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_VPC_FLOW_LOG_ACCESS_ROLE_${local.uuid}_${local.REGIONxTAG["${local.Region}"]}"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "vpc-flow-logs.amazonaws.com"
			},
			"Effect": "Allow"
		}
	]
}
EOF
	permissions_boundary = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
	path = "/"
}

resource "aws_cloudwatch_log_group" "VpcFlowLogGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_VPC_FLOW_LOG_GROUP_${local.uuid}_${local.REGIONxTAG["${local.Region}"]}"
}

resource "aws_subnet" "MgmtSubnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.MGMTxSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_subnet" "Test1Subnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.TEST1xSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_subnet" "Test2Subnet" {
	availability_zone = data.aws_availability_zones.available.names["${local.SUBNETxAVAILABILITYxZONExINDEX}"]
	cidr_block = local.TEST2xSUBNETxCIDRxBLOCK
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST2_SUBNET_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group" "MgmtSecurityGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group_rule" "MgmtIngressPing" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "ICMP"
	from_port = "-1"
	protocol = "icmp"
	to_port = "-1"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress1" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "-1"
	from_port = 0
	to_port = 0
	source_security_group_id = aws_security_group.MgmtSecurityGroup.id
}

resource "aws_security_group_rule" "MgmtIngress2" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 22
	to_port = 22
	cidr_blocks = [ local.EC2xCONNECTxCIDR["${local.Region}"] ]
}

resource "aws_security_group_rule" "MgmtIngress22" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 22
	to_port = 22
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress67" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "UDP port"
	from_port = "67"
	protocol = "udp"
	to_port = "68"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress80" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port - for IM(NV)"
	from_port = "80"
	protocol = "tcp"
	to_port = "80"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress111" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "111"
	protocol = "tcp"
	to_port = "111"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress123" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "UDP port"
	from_port = "123"
	protocol = "udp"
	to_port = "123"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress161" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "UDP port"
	from_port = "161"
	protocol = "udp"
	to_port = "162"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress443" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 443
	to_port = 443
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress605" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "UDP port"
	from_port = "605"
	protocol = "udp"
	to_port = "605"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress998" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "998"
	protocol = "tcp"
	to_port = "1000"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress1000" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id      
	description = "UDP port"
	from_port = "1000"
	protocol = "udp"
	to_port = "1000"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress1080" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "1080"
	protocol = "tcp"
	to_port = "1080"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress2345" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "2345"
	protocol = "tcp"
	to_port = "2345"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress2601" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "2601"
	protocol = "tcp"
	to_port = "2601"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress3222" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "3222"
	protocol = "tcp"
	to_port = "3222"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress3389" {
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "tcp"
	from_port = 3389
	to_port = 3389
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress3601" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "3601"
	protocol = "tcp"
	to_port = "3601"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress4501" {	                
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "4501"
	protocol = "tcp"
	to_port = "4502"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress4601" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "4601"
	protocol = "tcp"
	to_port = "4601"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress5285" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "5285"
	protocol = "tcp"
	to_port = "5286"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress5326" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "5326"
	protocol = "tcp"
	to_port = "5327"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress5480" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "5480"
	protocol = "tcp"
	to_port = "5480"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress5488" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "5488"
	protocol = "tcp"
	to_port = "5489"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress6001" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "6001"
	protocol = "tcp"
	to_port = "6005"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress6004" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "UDP port"
	from_port = "6004"
	protocol = "udp"
	to_port = "6004"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress6665" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "6665"
	protocol = "tcp"
	to_port = "6665"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress6967" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "6967"
	protocol = "tcp"
	to_port = "6967"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress6978" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "6978"
	protocol = "tcp"
	to_port = "6978"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress8021" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "8021"
	protocol = "tcp"
	to_port = "8022"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress8881" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "8881"
	protocol = "tcp"
	to_port = "8881"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress8989" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "8989"
	protocol = "tcp"
	to_port = "8990"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress9101" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "9101"
	protocol = "tcp"
	to_port = "9102"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress9613" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "9613"
	protocol = "tcp"
	to_port = "9676"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress10115" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "10115"
	protocol = "tcp"
	to_port = "10116"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress10116" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "UDP port"
	from_port = "10116"
	protocol = "udp"
	to_port = "10116"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress10119" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "10119"
	protocol = "tcp"
	to_port = "10119"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress17662" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "17662"
	protocol = "tcp"
	to_port = "17662"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress17668" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "17668"
	protocol = "tcp"
	to_port = "17777"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress18765" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "18765"
	protocol = "tcp"
	to_port = "18765"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress21123" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "21123"
	protocol = "tcp"
	to_port = "21123"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtIngress21653" {	
	type = "ingress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	description = "TCP port"
	from_port = "21653"
	protocol = "tcp"
	to_port = "21653"
	cidr_blocks = [ local.InboundIPv4CidrBlock ]
}

resource "aws_security_group_rule" "MgmtEgress1" {
	type = "egress"
	security_group_id = aws_security_group.MgmtSecurityGroup.id
	protocol = "-1"
	to_port = 0
	from_port = 0
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group" "Test1SecurityGroup" {
	name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
	vpc_id = aws_vpc.Vpc.id
	ingress {
		description = "HTTP port"
		from_port = "80"
		protocol = "tcp"
		to_port = "80"
		cidr_blocks = [ local.InboundIPv4CidrBlock ]
	}
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_SECURITY_GROUP_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_security_group_rule" "Test1Ingress1" {
	type = "ingress"
	security_group_id = aws_security_group.Test1SecurityGroup.id
	protocol = "-1"
	from_port = 0
	to_port = 0
	source_security_group_id = aws_security_group.Test1SecurityGroup.id
}

resource "aws_security_group_rule" "Test1Egress1" {
	type = "egress"
	security_group_id = aws_security_group.Test1SecurityGroup.id
	protocol = "-1"
	to_port = 0
	from_port = 0
	cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_default_security_group" "DefaultEgress1" {
	vpc_id = aws_vpc.Vpc.id

	egress {
		protocol = -1
		self = true
		from_port = 0
		to_port = 0
	}
}

resource "aws_internet_gateway" "InternetGw" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_INTERNET_GW_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route" "MgmtRoute" {
	destination_cidr_block = "0.0.0.0/0"
	route_table_id = aws_route_table.MgmtRouteTable.id
	gateway_id = aws_internet_gateway.InternetGw.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_route_table" "MgmtRouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_MGMT_ROUTE_TABLE_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route" "Test1Route" {
	destination_cidr_block = "0.0.0.0/0"
	route_table_id = aws_route_table.Test1RouteTable.id
	gateway_id = aws_internet_gateway.InternetGw.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_route_table" "Test1RouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST1_ROUTE_TABLE_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route" "Test2Route" {
	destination_cidr_block = "0.0.0.0/0"
	route_table_id = aws_route_table.Test2RouteTable.id
	gateway_id = aws_internet_gateway.InternetGw.id
	depends_on = [
		aws_internet_gateway.InternetGw
	]
}

resource "aws_route_table" "Test2RouteTable" {
	vpc_id = aws_vpc.Vpc.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_TEST2_ROUTE_TABLE_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_route_table_association" "MgmtSubnetRouteTableAssociation" {
	route_table_id = aws_route_table.MgmtRouteTable.id
	subnet_id = aws_subnet.MgmtSubnet.id
}

resource "aws_route_table_association" "Test1SubnetRouteTableAssociation" {
	route_table_id = aws_route_table.Test1RouteTable.id
	subnet_id = aws_subnet.Test1Subnet.id
}

resource "aws_route_table_association" "Test2SubnetRouteTableAssociation" {
	route_table_id = aws_route_table.Test2RouteTable.id
	subnet_id = aws_subnet.Test2Subnet.id
}

resource "aws_network_interface" "TestAppliance1Eth0" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE1_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.MgmtSubnet.id
	security_groups = [
		aws_security_group.MgmtSecurityGroup.id
	]
	private_ips = [ local.TESTAPPLIANCE1xETH0xPRIVATExIPxADDRESS ]
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE1_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_network_interface" "TestAppliance1Eth1" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE1_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.Test1Subnet.id
	security_groups = [
		aws_security_group.Test1SecurityGroup.id
	]
	private_ips = local.TESTAPPLIANCE1xETH1xPRIVATExIPxADDRESSES
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE1_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}
		
resource "aws_network_interface" "TestAppliance2Eth0" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE2_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.MgmtSubnet.id
	security_groups = [
		aws_security_group.MgmtSecurityGroup.id
	]
	private_ips = [ local.TESTAPPLIANCE2xETH0xPRIVATExIPxADDRESS ]
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE2_${local.APPxVERSION}_ETH0_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_network_interface" "TestAppliance2Eth1" {
	description = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE2_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
	source_dest_check = local.INTERFACExSOURCExDESTxCHECK
	subnet_id = aws_subnet.Test2Subnet.id
	security_groups = [
		aws_security_group.Test1SecurityGroup.id
	]
	private_ips = local.TESTAPPLIANCE2xETH1xPRIVATExIPxADDRESSES
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE2_${local.APPxVERSION}_ETH1_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
}

resource "aws_instance" "TestAppliance1" {
	disable_api_termination = local.INSTANCExDISABLExAPIxTERMINATION
	instance_initiated_shutdown_behavior = local.INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR
	ami = local.AMIxTESTAPPLIANCE["${local.Region}"]
	instance_type = local.TestApplianceInstanceType
	monitoring = local.INSTANCExMONITORING
	key_name = local.IxClientSSHKey
	placement_group = aws_placement_group.PlacementGroup.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE1_${local.APPxVERSION}_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
	network_interface {
		network_interface_id = aws_network_interface.TestAppliance1Eth0.id
		device_index = "0"
	}
	network_interface {
		network_interface_id = aws_network_interface.TestAppliance1Eth1.id
		device_index = "1"
	}
	ebs_block_device {
		device_name = local.INSTANCExBLOCKxDEVICExNAME
		delete_on_termination = local.INSTANCExEBSxDELETExONxTERMINATION
		volume_type = local.INSTANCExEBSxVOLUMExTYPE
	}
}

resource "aws_instance" "TestAppliance2" {
	disable_api_termination = local.INSTANCExDISABLExAPIxTERMINATION
	instance_initiated_shutdown_behavior = local.INSTANCExINSTANCExINITIATEDxSHUTDOWNxBEHAVIOR
	ami = local.AMIxTESTAPPLIANCE["${local.Region}"]
	instance_type = local.TestApplianceInstanceType
	monitoring = local.INSTANCExMONITORING
	key_name = local.IxClientSSHKey
	placement_group = aws_placement_group.PlacementGroup.id
	tags = {
		Name = "${local.UserLoginTag}_${local.PROJECTxTAG}_${local.APPxTAG}_TESTAPPLIANCE2_${local.APPxVERSION}_${local.REGIONxTAG["${local.Region}"]}"
		Owner = local.UserEmailTag
		Options = local.OPTIONSxTAG
		Project = local.PROJECTxTAG
	}
	network_interface {
		network_interface_id = aws_network_interface.TestAppliance2Eth0.id
		device_index = "0"
	}
	network_interface {
		network_interface_id = aws_network_interface.TestAppliance2Eth1.id
		device_index = "1"
	}
	ebs_block_device {
		device_name = local.INSTANCExBLOCKxDEVICExNAME
		delete_on_termination =  local.INSTANCExEBSxDELETExONxTERMINATION
		volume_type = local.INSTANCExEBSxVOLUMExTYPE
	}
}

resource "aws_eip" "TestAppliance1Eth0ElasticIp" {
	vpc = true
	network_interface = aws_network_interface.TestAppliance1Eth0.id
	depends_on = [
		aws_internet_gateway.InternetGw,
		aws_instance.TestAppliance1
	]
}

resource "aws_eip" "TestAppliance2Eth0ElasticIp" {
	vpc = true
	network_interface = aws_network_interface.TestAppliance2Eth0.id
	depends_on = [
		aws_internet_gateway.InternetGw,
		aws_instance.TestAppliance2
	]
}