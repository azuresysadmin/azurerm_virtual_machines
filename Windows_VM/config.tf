locals {
  # Regional locals
  suffix   = "" # Set something that identifies your deployment, such as "john-dev-vm"
  location = "" # Set the default location for your deployment, such as "westeurope"

  # Tagging locals
  common_tags = {
    project     = "" # Set a project tag, such as "john-dev-linuxvm"
    environment = "" # Set an environment tag, such as "development"
    contact     = "" # Set contact information for the deployment, such as "john.doe@mail.com"
  }

  # Vnet locals
  vnet_addr = [""] # Set the address space for the vnet

  # Subnet locals
  subnet_addr = [""] # Set the address space for the subnet

  # Public IP locals
  allocation_method = "" # Choose either a Static or Dynamic IP
  publicIP          = "" # Set the value to your publicIP address

  # Auto shutdown locals
  time     = "1800"                    # Set the 24h time when the VM should turn off automatically. Such as "1800"
  timezone = "W. Europe Standard Time" # Set the timezone which should be used

  # Random password locals
  length           = 12    # Set the length of the password
  special          = false # Should specials be included, false or true
  override_special = ""    # If/what special characters should be overriden
  min_special      = 0     # Set the minimum special characters

  # Windows VM locals
  admin_username = ""                       # Set your preferred admin user name
  hostname       = ""                       # Set the OS level hostname
  vmsize         = "Standard_D2_v4"         # Set the size of the VM, such as "Standard_D2_v4"
  publisher      = "MicrosoftWindowsServer" # Set the publisher of the OS, such as "MicrosoftWindowsServer"
  offer          = "WindowsServer"          # Set the VM offer, such as "WindowsServer"
  sku            = "2022-Datacenter"        # Set the SKU for the OS, such as "2022-Datacenter"
  version        = "latest"                 # Set the OS version, such as "latest"
}
