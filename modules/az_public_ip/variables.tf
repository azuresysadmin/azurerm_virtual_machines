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

variable "pip-name" {
  type        = string
  description = "Name of the resource deployment, i.e vnet/rg/kv"
}

variable "allocation_method" {
  type        = string
  description = "Should the IP be Static or Dyanamic"
}
