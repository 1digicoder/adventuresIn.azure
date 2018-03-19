#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rg_name=`cat ${__dir}/acr.json | jq -r '.acr.resource_group.name'`
rg_location=`cat ${__dir}/acr.json | jq -r '.acr.resource_group.location'`
acr_name=`cat ${__dir}/acr.json | jq -r '.acr.name'`
acr_sku=`cat ${__dir}/acr.json | jq -r '.acr.sku'`

#Create ACR
az acr create \
    -g ${rg_name} \
    -l ${rg_location} \
    -n ${acr_name} \
    --sku ${acr_sku}

az acr login --name ${acr_name}