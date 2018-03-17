#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rg_name=`cat ${__dir}/jenkins.json | jq -r '.jenkins.resource_group.name'`
rg_location=`cat ${__dir}/jenkins.json | jq -r '.jenkins.resource_group.location'`

#Create Resource Group
az group create -n ${rg_name} -l ${rg_location}
