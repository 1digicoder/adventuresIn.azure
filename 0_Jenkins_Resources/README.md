# Adventures In Azure
## Jenkins setup and install

The goal of these scripts are to demonstrate methods of creating build server for use in the rest of the various 'recipes'.
There will be 'pet' versions that will require full setup and customization of Jenkins as well as 'cattle' versions
that will be used to automate the full installation of a build server.

# Needed utilities
* jq
* azure-cli

## Prerequisites - Create Key vault and install test cert
## Scripts used here
* ./createResources.sh - Will create holding Azure resource group for build server
* ./createVirtualMachine.sh - Will create VM to host build server
  * This will install nginx as proxy front end to Jenkins
  * This will open port 443 (SSL) to this Jenkins instance
  * This is the pet IaaS version. It creates a VM that you must handle, as well as Jenkins installation you have to setup
* ./destoryResources.sh - Will destory the entire container and all resources in it
