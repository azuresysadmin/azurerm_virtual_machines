output "vm_id" {
  value       = azurerm_windows_virtual_machine.windowsvm.id
  description = "The ID of the VM"
}

output "public_ip" {
  value       = azurerm_windows_virtual_machine.windowsvm.public_ip_address
  description = "The Public IP of the VM"
}

output "admin_username" {
  value       = azurerm_windows_virtual_machine.windowsvm.admin_username
  sensitive   = true
  description = "The user name"
}

output "admin_password" {
  value       = azurerm_windows_virtual_machine.windowsvm.admin_password
  sensitive   = true
  description = "The password associated with the admin user"
}
