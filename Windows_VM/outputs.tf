output "windows_vm_resource_group" {
  value       = module.resource_group.resource_name
  description = "The Resource Group with all of the deployments"
}

output "windows_vm_publicIP" {
  value       = module.windowsvm.public_ip
  description = "The IP address of the Virtual Machine"
}

output "admin_username" {
  value       = module.windowsvm.admin_username
  sensitive   = true
  description = "The user name"
}

output "admin_password" {
  value       = module.windowsvm.admin_password
  sensitive   = true
  description = "The password associated with the admin user"
}
