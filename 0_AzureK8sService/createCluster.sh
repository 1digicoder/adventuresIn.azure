#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rg_name=`cat ${__dir}/ak8sService.json | jq -r '.k8s.resource_group.name'`
rg_location=`cat ${__dir}/ak8sService.json | jq -r '.k8s.resource_group.location'`
cluster_name=`cat ${__dir}/ak8sService.json | jq -r '.k8s.name'`
cluster_nodeCount=`cat ${__dir}/ak8sService.json | jq -r '.k8s.node_count'`
cluster_vmSize=`cat ${__dir}/ak8sService.json | jq -r '.k8s.vm_size'`

az aks create --resource-group ${rg_name} \
    --name ${cluster_name} \
    --node-count ${cluster_nodeCount} \
    --node-size ${cluster_vmSize}
    --generate-ssh-keys