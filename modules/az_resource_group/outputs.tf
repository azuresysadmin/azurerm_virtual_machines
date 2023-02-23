# Output variables for Resource Group module
output "resource_name" {
  value       = azurerm_resource_group.resource_group.name
  description = "Output name of the deployed Resource Group"
}

output "resource_group_location" {
  value       = azurerm_resource_group.resource_group.location
  description = "The location of the resource group"

}
