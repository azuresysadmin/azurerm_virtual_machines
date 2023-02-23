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
variable "rg-name" {
  type        = string
  description = "Resource name for the deployment, to use with suffix."
}
