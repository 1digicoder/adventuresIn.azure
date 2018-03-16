#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

rg_name=`cat ${__dir}/security.json | jq -r '.security.resource_group.name'`
rg_location=`cat ${__dir}/security.json | jq -r '.security.resource_group.location'`
key_vault=`cat ${__dir}/security.json | jq -r '.security.keyVault.name'`
cert_name=`cat ${__dir}/security.json | jq -r '.security.certificate.name'`

az keyvault certificate create \
    --vault-name ${key_vault} \
    --name ${cert_name} \
    --policy "$(az keyvault certificate get-default-policy)"
