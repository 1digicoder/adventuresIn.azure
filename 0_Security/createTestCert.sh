#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rg_name=`cat ${__dir}/security.json | jq -r '.security.resource_group.name'`
rg_location=`cat ${__dir}/security.json | jq -r '.security.resource_group.location'`
key_vault=`cat ${__dir}/security.json | jq -r '.security.keyVault.name'`
cert_name=`cat ${__dir}/security.json | jq -r '.security.certificate.name'`

#Create test certificate in the key vault
az keyvault certificate create \
    --vault-name ${key_vault} \
    --name ${cert_name} \
    --policy "$(az keyvault certificate get-default-policy)"
