#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

rg_name=`cat ${__dir}/ak8sService.json | jq -r '.k8s.resource_group.name'`
rg_location=`cat ${__dir}/ak8sService.json | jq -r '.k8s.resource_group.location'`

OLD_IFS=$IFS
IFS=$'\n'

registerIfNeeded() {
    if [ $1 = $2 ]; then
        az provider register -n $1
    fi
}

declare -a k8sResources

#get registered providers
let i=0
for resource in $(az provider list | jq -r ".[].namespace" | grep Microsoft); do
    k8sResources[i]=${resource}
    ((++i))
done

#check registered providers and register if needed
let i=0
while (( ${#k8sResources[@]} > i)); do
    registerIfNeeded "${k8sResources[i]}" "Microsoft.ContainerService"
    registerIfNeeded "${k8sResources[i]}" "Microsoft.Network"
    registerIfNeeded "${k8sResources[i]}" "Microsoft.Compute"
    registerIfNeeded "${k8sResources[i]}" "Microsoft.Storage"
    ((++i))
done

IFS=$OLD_IFS
