resource "azurerm_windows_virtual_machine" "windowsvm" {
  name                  = var.vm-name
  computer_name         = var.computer_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vmsize
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = var.network_interface_ids

  dynamic "os_disk" {
    for_each = var.os_disk
    content {
      caching              = os_disk.value["caching"]
      storage_account_type = os_disk.value["storage_account_type"]
    }
  }

  dynamic "source_image_reference" {
    for_each = var.source_image_reference

    content {
      publisher = source_image_reference.value["publisher"]
      offer     = source_image_reference.value["offer"]
      sku       = source_image_reference.value["sku"]
      version   = source_image_reference.value["version"]
    }
  }

  tags = var.tags
}
