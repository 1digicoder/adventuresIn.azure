#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

resource_group=`cat ${__dir}/jenkins.json | jq -r '.jenkins.resource_group'`
location=`cat ${__dir}/jenkins.json | jq -r '.jenkins.location'`

az group create -n ${resource_group} -l ${location}
