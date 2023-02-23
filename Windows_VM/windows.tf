# Load the resource group module
module "resource_group" {
  source   = "../modules/az_resource_group"
  rg-name  = "rg-${local.suffix}"
  location = local.location

  tags = local.common_tags
}

# Load the vnet module and associate it with the resource group
module "vnet" {
  source              = "../modules/az_vnet"
  vnet-name           = "vnet-${local.suffix}"
  resource_group_name = module.resource_group.resource_name
  location            = module.resource_group.resource_group_location
  address_space       = local.vnet_addr # Choose your address space

  tags = local.common_tags
}

# Load the subnet module and associate it with the vnet
module "subnet" {
  source               = "../modules/az_subnet"
  subnet-name          = "subnet-${local.suffix}"
  resource_group_name  = module.resource_group.resource_name
  location             = module.resource_group.resource_group_location
  virtual_network_name = module.vnet.virtual_network_name
  address_prefixes     = local.subnet_addr

  tags = local.common_tags
}

# Load the public IP module
module "pip" {
  source              = "../modules/az_public_ip"
  pip-name            = "pip-${local.suffix}"
  resource_group_name = module.resource_group.resource_name
  location            = module.resource_group.resource_group_location
  allocation_method   = local.allocation_method

  tags = local.common_tags
}

# Load the NIC module and associate it with the subnet and the PIP
module "nic" {
  source              = "../modules/az_network_interface"
  nic-name            = "nic-${local.suffix}"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_name

  subnet_id                     = module.subnet.subnet_id
  private_ip_address_allocation = "Dynamic"
  public_ip_address_id          = module.pip.pip_id

  tags = local.common_tags
}

# Load the NSG module and define it according to your public IP and nsg rules. (RDP, 3389)
module "nsg" {
  source              = "../modules/az_network_security_group"
  nsg-name            = "nsg-${local.suffix}"
  resource_group_name = module.resource_group.resource_name
  location            = module.resource_group.resource_group_location

  nsg_rules = [
    {
      name                       = "RDP"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = local.publicIP
      destination_address_prefix = "*"
    }
  ]

  tags = local.common_tags
}

# Load the NSG/NIC rule association module
module "network-rule-binder" {
  source                    = "../modules/az_nsg_association"
  network_interface_id      = module.nic.network_interface_id
  network_security_group_id = module.nsg.network_security_group_id
}

# Load the password generator module. Set desired configurations
module "password_generator" {
  source           = "../modules/random_password"
  length           = local.length
  special          = local.special
  override_special = "@?$§&/{}:"
  min_upper        = 3
  min_lower        = 3
  min_numeric      = 3
  min_special      = local.min_special
}

# Load the Windows VM module and associate it with its dependencies
module "windowsvm" {
  source              = "../modules/az_windows_virtual_machine"
  vm-name             = "winvm-${local.suffix}"
  computer_name       = local.hostname
  resource_group_name = module.resource_group.resource_name
  location            = module.resource_group.resource_group_location
  vmsize              = "Standard_D2_v4"
  admin_username      = local.admin_username
  admin_password      = module.password_generator.password_result
  network_interface_ids = [
  module.nic.network_interface_id, ]

  os_disk = [
    {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
  ]

  source_image_reference = [{
    offer     = local.offer
    publisher = local.publisher
    sku       = local.sku
    version   = local.version
  }]

  tags = local.common_tags
}

# Load the shutdown module and assign it to the VM
module "vm_shutdown" {
  source             = "../modules/az_vm_auto_shutdown"
  virtual_machine_id = module.windowsvm.vm_id
  location           = module.resource_group.resource_group_location

  daily_recurrence_time = local.time
  timezone              = local.timezone
}
