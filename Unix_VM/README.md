# Unix-based virtual machine in Azure
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >3.4.0 |

## Modules

| Name | Source 
|------|--------|
| <a name="module_linuxvm"></a> [linuxvm](#module\_linuxvm) | ../modules/az_linux_virtual_machine | n/a |
| <a name="module_network-rule-binder"></a> [network-rule-binder](#module\_network-rule-binder) | ../modules/az_nsg_association | n/a |
| <a name="module_nic"></a> [nic](#module\_nic) | ../modules/az_network_interface | n/a |
| <a name="module_nsg"></a> [nsg](#module\_nsg) | ../modules/az_network_security_group | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../modules/az_public_ip | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ../modules/az_resource_group | n/a |
| <a name="module_subnet"></a> [subnet](#module\_subnet) | ../modules/az_subnet | n/a |
| <a name="module_vm_shutdown"></a> [vm\_shutdown](#module\_vm\_shutdown) | ../modules/az_vm_auto_shutdown | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../modules/az_vnet | n/a |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The admin user name |
| <a name="output_linux_vm_publicIP"></a> [linux\_vm\_publicIP](#output\_linux\_vm\_publicIP) | The IP address of the Virtual Machine |
| <a name="output_linux_vm_resource_group"></a> [linux\_vm\_resource\_group](#output\_linux\_vm\_resource\_group) | The Resource Group with all of the deployments |
---

## Resources that will be built
This deployment will create:
- A resource group
- A virtual network
- A subnet within the virtual network
- A NIC that will be associated with the VM
- A NSG that will be associated with the NIC
- A public IP (static or dynamic) associated with the VM
- A Unix VM
- An automatic shutdown schedule for the VM

## Description
A Unix VM will be deployed with your configurations. It will only allow inbound access over SSH (port 22) and only for your client's public IP.

## SSH key pair
Your public SSH key will be uploaded for authentication towards the VM.

## backend.tf
Fill in your backend configuration setting. You can use a local backend, but it's recommended to use a remote backend Storage Account.  

## config.tf
Fill in your desired configuration. Other configurations will be static, but minor adjustments can be done directly in unix.tf, even though it's not necessary in order to deploy the infrastructure.

## outputs.tf
The output values besides the resource group name are sensitive, but can be shown if you run "terraform output -json".

## Public IP
Use these commands to show your public IP address that should be associated with "local.publicIP". 
- PublicIP (Bash): alias publicIP="curl -s ipinfo.io | jq -r '.ip'    
- PublicIP (CMD): nslookup myip.opendns.com resolver1.opendns.com

## Deployment
- Run "terraform init" to initialize your providers and your backend. 
- Run "terraform plan" to show your execution plan (optional). 
- Run "terraform apply" to deploy the infrastructure.

## Destroy
- Run "terraform apply -destroy" to destroy the infrastructure.

### How to connect
- Run a "terraform output -json" to show the resource group name, the virtual machine's public IP and your admin credentials.
- Authenticate by running "ssh -i path_to_private_key user@publicIPaddress" in your terminal, insert your passphrase. Done!