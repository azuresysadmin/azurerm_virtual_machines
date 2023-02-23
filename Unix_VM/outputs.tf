output "linux_vm_resource_group" {
  value       = module.resource_group.resource_name
  description = "The Resource Group with all of the deployments"
}

output "linux_vm_publicIP" {
  value       = module.linuxvm.public_ip
  sensitive   = true
  description = "The IP address of the Virtual Machine"
}

output "admin_username" {
  value       = module.linuxvm.admin_username
  sensitive   = true
  description = "The admin user name"
}
