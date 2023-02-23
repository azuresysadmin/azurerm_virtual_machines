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

variable "network_interface_ids" {
  type        = list(string)
  description = "The ID of the NIC"
}

variable "vm-name" {
  type        = string
  description = "The name of the virtual machine"
}

variable "vmsize" {
  type        = string
  description = "The size of the VM, ie. Standard_F2"
}

variable "admin_username" {
  type        = string
  description = "The username for accessing the VM"
}
variable "ssh_account" {
  type = list(object({
    username   = string
    public_key = string
  }))
  description = "The username and ssh key location to use for auth"
}

variable "os_disk" {
  type = list(object({
    caching              = string
    storage_account_type = string
  }))
  description = "Decide what type of OS-disk to use"
}

variable "source_image_reference" {
  type = list(object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  }))
  description = "Decide what type of OS, sku and version to use"
}
