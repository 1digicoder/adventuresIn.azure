#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rg_name=`cat ${__dir}/ak8sService.json | jq -r '.k8s.resource_group.name'`
rg_location=`cat ${__dir}/ak8sService.json | jq -r '.k8s.resource_group.location'`

#Create Resource Group
az group create -n ${rg_name} -l ${rg_location}