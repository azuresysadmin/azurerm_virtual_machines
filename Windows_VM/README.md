# Windows-based virtual machine in Azure

## Resources that will be built
This deployment will create:
- A resource group
- A virtual network
- A subnet within the virtual network
- A NIC that will be associated with the VM
- A NSG that will be associated with the NIC
- A public IP (static or dynamic) associated with the VM
- A random password for the admin password
- A Windows VM
- An automatic shutdown schedule for the VM

## Description
A Windows VM will be deployed with your configurations. It will only allow inbound access over RDP (port 3389) and only for your client's public IP.  

## backend.tf
Fill in your backend configuration setting. You can use a local backend, but it's recommended to use a remote backend Storage Account.  

## config.tf
Fill in your desired configuration. Other configurations will be static, but minor adjustments can be done directly in windows.tf, even though it's not necessary in order to deploy the infrastructure.

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
- Authenticate with your RDP tool of choice to the public IP shown in the output and use the admin credentials to log on. Done!