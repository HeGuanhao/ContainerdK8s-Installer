#!/bin/bash

set -e

# Source the utils.sh script
source ./scripts/utils.sh

if [[ -f "./roles/plugins/jq" ]]; then
    echo ———————————————————— Jq exists ——————————————————————
else
    echo ———————————————————— Downloading jq related files ——————————————————————
    ./roles/plugins/package.sh
    echo ———————————————————— jq download completed ——————————————————————
fi

if which ctr &> /dev/null; then
    echo ———————————————————— Contianerd exists ——————————————————————
else
    echo ———————————————————— Downloading containerd related files ——————————————————————
    ./roles/containerd/package.sh
    echo ———————————————————— Containerd download completed ——————————————————————

fi

if [[ -f "./roles/cfssl/cfssl-scan" ]]; then
    echo ———————————————————— Cfssl exists ——————————————————————
else
    echo ———————————————————— Downloading cfssl related files ——————————————————————
    ./roles/cfssl/package.sh
    echo ———————————————————— Cfssl download completed ——————————————————————
fi

if [[ -f "./roles/calico/calicoctl" ]]; then
    echo ———————————————————— Calico exists ——————————————————————
else
    echo ———————————————————— Downloading calico related files ——————————————————————
    ./roles/calico/package.sh
    echo ———————————————————— Calico download completed ——————————————————————
fi

if which kubelet &> /dev/null; then
    echo ———————————————————— Kubernetes exists ——————————————————————
else
    echo ———————————————————— Downloading kubernetes related files ——————————————————————
    ./roles/calico/package.sh
    echo ———————————————————— kubernetes download completed ——————————————————————
fi

