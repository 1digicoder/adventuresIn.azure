#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rg_name=`cat ${__dir}/jenkins.json | jq -r '.jenkins.resource_group.name'`
rg_location=`cat ${__dir}/jenkins.json | jq -r '.jenkins.resource_group.location'`
vm_name=`cat ${__dir}/jenkins.json | jq -r '.jenkins.vm.name'`
vm_size=`cat ${__dir}/jenkins.json | jq -r '.jenkins.vm.size'`
dns_name=`cat ${__dir}/jenkins.json | jq -r '.jenkins.vm.dnsName'`
key_vault=`cat ${__dir}/jenkins.json | jq -r '.security.keyVault.name'`
cert_name=`cat ${__dir}/jenkins.json | jq -r '.security.certificate.name'`

secret=$(az keyvault secret list-versions \
    --vault-name ${key_vault} \
    --name ${cert_name} \
    --query "[?attributes.enabled].id" --output tsv)

vm_secret=$(az vm format-secret --secret "$secret")

az vm create --resource-group ${rg_name} \
    --name ${vm_name} \
    --size ${vm_size} \
    --image UbuntuLTS \
    --admin-username azureuser \
    --generate-ssh-keys \
    --custom-data cloud-init-jenkins.yml \
    --secrets "${vm_secret}"

#Only allow SSL traffic in
az vm open-port --resource-group ${rg_name} --name ${vm_name} --port 443 --priority 1001

#remove while deciding on demo project to host
#az vm open-port --resource-group ${rg_name} --name ${vm_name} --port 1337 --priority 1002