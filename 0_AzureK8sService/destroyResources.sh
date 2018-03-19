#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rg_name=`cat ${__dir}/ak8sService.json | jq -r '.k8s.resource_group.name'`
rg_location=`cat ${__dir}/ak8sService.json | jq -r '.k8s.resource_group.location'`

az group delete -y -n ${rg_name}
