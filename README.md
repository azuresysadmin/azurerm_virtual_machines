# Virtual Machines for Windows or Unix systems for Azure using Terraform
This repository contains two easy deployments for a Unix and a Windows VM with its dependencies.  
These deployments will create everything that is needed for a functional VM.   
The only existing infrastructure you need (unless if you run a local backend) is a remote storage, such as an Azure Storage Account for your backend.  Everything else will be deployed.  

# Prerequisities
- Terraform 3.30 or higher, Azure CLI and an Azure Subscription. 
- These deployments are built to be deployed with an existing user account, directly from your terminal of choice.  

# Usage
1. CD into either Unix_VM or Windows_VM. You only have to modify the inputs in config.tf and backend.tf.  
2. Set your backend configuration in backend.tf, then set your local values in config.tf. No other configuration is necessary.
3. Run Terraform init, plan and apply from within the working directory. Run "terraform apply -destroy" to delete your infrastructure.

# Further documentation
A more detailed documentation is found within the Unix_VM and Windows_VM directories.