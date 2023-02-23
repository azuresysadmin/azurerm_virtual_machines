output "pip_id" {
  value       = azurerm_public_ip.pip.id
  description = "The ID of the public IP"
}

output "ip_address" {
  value       = azurerm_public_ip.pip.ip_address
  description = "The IP address"
}
