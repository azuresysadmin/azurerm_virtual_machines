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

  # Linux VM locals
  sysadmin        = ""                             # Set your preferred username for ssh and Linux user name
  pubkey_location = file("~/.ssh/id_rsa.pub")      # Set the path to your public ssh key. Will leave this as a default value.
  vmsize          = "Standard_DS1_v2"              # Set the size of the VM, such as "Standard_DS1_v2"
  publisher       = "Canonical"                    # Set the publisher of the OS, such as "Canonical"
  offer           = "0001-com-ubuntu-server-jammy" # Set the VM offer, such as "UbuntuServer"
  sku             = "22_04-lts-gen2"               # Set the SKU for the OS, such as "22_04-lts-gen2"
  version         = "22.04.202302140"              # Set the OS version, such as "latest"
}
