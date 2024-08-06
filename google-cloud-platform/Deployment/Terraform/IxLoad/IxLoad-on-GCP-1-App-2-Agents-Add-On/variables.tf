variable "AgentMachineType" {
	default = "c2-standard-8"
	description = "Designation for set of resources available to Agent VM"
	type = string
	validation {
		condition = can(regex("c2-standard-16", var.AgentMachineType)) || can(regex("c2-standard-8", var.AgentMachineType)) || can(regex("c2-standard-4", var.AgentMachineType))
		error_message = "AgentMachineType must be one of (c2-standard-16 | c2-standard-8 | c2-standard-4) types."
	}
}

variable "AppMachineType" {
	default = "n1-standard-4"
	description = "Designation for set of resources available to App VM"
	type = string
	validation {
		condition = can(regex("n1-standard-8", var.AppMachineType)) || can(regex("n1-standard-4", var.AppMachineType))
		error_message = "AppMachineType must be one of (n1-standard-8 | n1-standard-4) types."
	}
}

variable "Credentials" {
	description = "Path to (or contents of) a service account key file in JSON format"
	sensitive = true
	type = string
}

variable "PrivateSubnetName" {
	description = "Name tag associated with the private subnet"
	type = string
}

variable "PrivateVpcNetworkName" {
	description = "Name tag associated with the private vpc network"
	type = string
}

variable "ProjectId" {
	description = "Globally unique identifier for working project"
	type = string
}

variable "PublicSubnetName" {
	description = "Name tag associated with the public subnet"
	type = string
}

variable "PublicVpcNetworkName" {
	description = "Name tag associated with the public vpc network"
	type = string
}

variable "RegionName" {
	default = "us-central1"
	description = "Geographical location where resources can be hosted" 
	type = string
}

variable "UserEmailTag" {
	default = null
	description = "Email address tag of user creating the deployment"
	type = string
	validation {
		condition = var.UserEmailTag == null ? true : length(var.UserEmailTag) >= 14
		error_message = "UserEmailTag minimum length must be >= 14."
	}
}

variable "UserLoginTag" {
	default = null
	description = "Login ID tag of user creating the deployment"
	type = string
	validation {
		condition = var.UserLoginTag == null ? true : length(var.UserLoginTag) >= 4
		error_message = "UserLoginTag minimum length must be >= 4."
	}
}

variable "UserProjectTag" {
	default = null
	description = "Project tag of user creating the deployment"
	type = string
}

variable "ZoneName" {
	default = "us-central1-a"
	description = "Deployment area within a region"
	type = string
}