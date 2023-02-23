output "vm_id" {
  value       = azurerm_linux_virtual_machine.linuxvm.id
  description = "The ID of the VM"
}

output "public_ip" {
  value       = azurerm_linux_virtual_machine.linuxvm.public_ip_address
  description = "The Public IP of the VM"
}

output "admin_username" {
  value       = azurerm_linux_virtual_machine.linuxvm.admin_username
  description = "The admin user name"
}
