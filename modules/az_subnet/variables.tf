# General variables
variable "location" {
  type        = string
  description = "The Azure Region to use"
}

variable "tags" {
  type        = map(string)
  description = "Default tags"
}

# Resource-specific variables: 
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group for the deployment"

}

variable "address_prefixes" {
  type        = list(any)
  description = "The address space for the subnet"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the vnet which the subnet should be associated with"

}
variable "subnet-name" {
  type        = string
  description = "Name of the resource deployment, i.e vnet/rg/kv"
}
