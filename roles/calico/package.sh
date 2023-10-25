#!/bin/bash

set -e

source ./scripts/utils.sh

calico_version=$(getVersion "calico")

curl -L https://github.com/projectcalico/calico/releases/download/v${calico_version}/calicoctl-linux-${ARCH} -o calicoctl