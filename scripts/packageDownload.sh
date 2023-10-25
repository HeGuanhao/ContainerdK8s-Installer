#!/bin/bash

set -e

# Source the utils.sh script
source ./utils.sh

if [[ -f "../roles/plugins/jq" ]]; then
    echo ———————————————————— Jq exists ——————————————————————
else
    echo ———————————————————— Downloading jq related files ——————————————————————
    ./roles/plugins/package.sh
fi

if which ctr &> /dev/null; then
    echo ———————————————————— Contianerd exists ——————————————————————
else
    echo ———————————————————— Downloading containerd related files ——————————————————————
    ./roles/containerd/package.sh
fi

if [[ -f "../roles/cfssl/cfssl-scan" ]]; then
    echo ———————————————————— Cfssl exists ——————————————————————
else
    echo ———————————————————— Downloading cfssl related files ——————————————————————
    ./roles/cfssl/package.sh
fi

if [[ -f "../roles/calico/calicoctl" ]]; then
    echo ———————————————————— Calico exists ——————————————————————
else
    echo ———————————————————— Downloading calico related files ——————————————————————
    ./roles/calico/package.sh
fi


