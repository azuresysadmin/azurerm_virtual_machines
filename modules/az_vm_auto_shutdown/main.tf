resource "azurerm_dev_test_global_vm_shutdown_schedule" "shutdown" {
  virtual_machine_id = var.virtual_machine_id
  location           = var.location
  enabled            = true

  daily_recurrence_time = var.daily_recurrence_time
  timezone              = var.timezone


  notification_settings {
    enabled = false
  }
}
