terraform {
  experiments = [variable_validation]
}

variable "Region" {
	type = string
	default = "us-east-1"
}

variable "UserEmailTag" {
	type = string
	default = "aws-ixload@amazon.com"
	description = "Email address tag of user creating the stack"
	validation {
		condition = length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	type = string
	default = "aws-ixload"
	description = "Login ID tag of user creating the stack"
	validation {
		condition = length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "IxClientSSHKey" {
	description = "Name of an existing EC2 KeyPair to enable SSH access"
	type = string
	default = "aws-ixload-key-pair"
}

variable "TestApplianceInstanceType" {
	description = "Instance type of TESTAPPLIANCE Appliance VM"
	type = string
	default = "c4.8xlarge"
	validation {
		condition =  can(regex("c4.8xlarge", var.TestApplianceInstanceType)) || can(regex("c4.4xlarge", var.TestApplianceInstanceType)) || can(regex("c4.2xlarge", var.TestApplianceInstanceType))
		error_message = "TestApplianceInstanceType must be one of (c4.8xlarge | c4.4xlarge | c4.2xlarge) types."
	}
}

variable "InboundIPv4CidrBlock" {
	type = string
	default = "1.1.1.1/32"
	description = "IP Address /32 or IP CIDR range connecting inbound to Keysight Client"
	validation {
		condition = length(var.InboundIPv4CidrBlock) >= 9 && length(var.InboundIPv4CidrBlock) <= 18 && can(regex("(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,2})", var.InboundIPv4CidrBlock))
		error_message = "InboundIPv4CidrBlock must be a valid IP CIDR range of the form x.x.x.x/x."
	}
}