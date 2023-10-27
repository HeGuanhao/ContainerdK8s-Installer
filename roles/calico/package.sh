#!/bin/bash

set -e

source ./scripts/utils.sh

calico_version=$(getVersion "calico")

curl -L https://github.com/projectcalico/calico/releases/download/v${calico_version}/calicoctl-linux-${ARCH} -o ./roles/calico/calicoctl

curl https://raw.githubusercontent.com/projectcalico/calico/v${calico_version}/manifests/calico.yaml -o ./roles/calico/calico.yaml

grep "image: " ./roles/calico/calico.yaml | uniq |cut -d  ":"  -f 2,3 |sed 's/^[ \t]*//g'|tee ./roles/calico/images/calico.txt