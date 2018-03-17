#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rg_name=`cat ${__dir}/security.json | jq -r '.security.resource_group.name'`

#delete entire resource group
az group delete -y -n ${rg_name}
