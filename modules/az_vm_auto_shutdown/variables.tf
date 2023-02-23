# General variables
variable "location" {
  type        = string
  description = "The Azure Region to use"
}

# Resource-specific variables: 
variable "virtual_machine_id" {
  type        = string
  description = "The ID of the VM"
}

variable "daily_recurrence_time" {
  type        = string
  description = "When should the VM turn off"
}

variable "timezone" {
  type        = string
  description = "Set the timezone which should be used"
}
