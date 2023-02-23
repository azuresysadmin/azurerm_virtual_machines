# General variables
variable "location" {
  type        = string
  description = "The Azure Region to use"
}

# Tagging variables
variable "tags" {
  type        = map(string)
  description = "Default tags"
}

# Resource-specific variables: 
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group for the deployment"

}

variable "address_space" {
  type        = list(any)
  description = "The address space for the Vnet"
}

variable "vnet-name" {
  type        = string
  description = "Name of the resource deployment, i.e vnet/rg/kv"
}
