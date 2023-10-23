#!/bin/bash

set -e

# Source the utils.sh script
source ./utils.sh

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

