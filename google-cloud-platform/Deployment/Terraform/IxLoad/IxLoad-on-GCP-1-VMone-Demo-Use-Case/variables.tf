terraform {
	required_version = ">= 0.12.24"
	experiments = [variable_validation]
}

variable "GCP_PROJECT_NAME" {
	type = string
	default = "ixload-ve-gcp"
}

variable "GCP_REGION_NAME" {
	type = string
	default = "us-central1"
}

variable "GCP_ZONE_NAME" {
	type = string
	default = "us-central1-a"
}

variable "GCP_OWNER_TAG" {
	type = string
	default = "gcp-ixload@google.com"
}

variable "GCP_LOGIN_ID_TAG" {
	type = string
	default = "gcp-ixload"
}

variable "GCP_PROJECT_TAG" {
	type = string
	default = "ixload-ve-gcp-gcp-ixload"
}

variable "GCP_MGMT_FIREWALL_RULE_SOURCE_IP_RANGES" {
	type = list(string)
	default = [
		"1.1.1.1/32"
	]
}

variable "GCP_CLIENT_MACHINE_TYPE" {
	type = string
	default = "n1-standard-4"
	validation {
		condition = can(regex("n1-standard-8", var.GCP_CLIENT_MACHINE_TYPE)) || can(regex("n1-standard-4", var.GCP_CLIENT_MACHINE_TYPE))
		error_message = "GCP_CLIENT_MACHINE_TYPE must be one of (n1-standard-8 | n1-standard-4) types."
	}
}

variable "GCP_VMONE_MACHINE_TYPE" {
	type = string
	default = "c2-standard-16"
	validation {
		condition = can(regex("c2-standard-16", var.GCP_VMONE_MACHINE_TYPE)) || can(regex("c2-standard-8", var.GCP_VMONE_MACHINE_TYPE)) || can(regex("c2-standard-4", var.GCP_VMONE_MACHINE_TYPE))
		error_message = "GCP_VMONE_MACHINE_TYPE must be one of (c2-standard-16 | c2-standard-8 | c2-standard-4) types."
	}
}