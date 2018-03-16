#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

rg_name=`cat ${__dir}/jenkins.json | jq -r '.jenkins.resource_group.name'`
rg_location=`cat ${__dir}/jenkins.json | jq -r '.jenkins.resource_group.location'`
vm_name=`cat ${__dir}/jenkins.json | jq -r '.jenkins.vm.name'`
vm_size=`cat ${__dir}/jenkins.json | jq -r '.jenkins.vm.size'`

az vm create --resource-group ${rg_name} \
    --name ${vm_name} \
    --size ${vm_size} \
    --image UbuntuLTS \
    --admin-username azureuser \
    --generate-ssh-keys \
    --custom-data cloud-init-jenkins.txt

az vm open-port --resource-group ${rg_name} --name ${vm_name} --port 8080 --priority 1001
az vm open-port --resource-group ${rg_name} --name ${vm_name} --port 1337 --priority 1002
