#!/bin/bash

set -e

source ./scripts/utils.sh

jq_version=$(getVersion "jq")
skopeo_version=$(getVersion "skopeo")

curl -L https://github.com/jqlang/jq/releases/download/jq-1.7/jq-linux-${ARCH} -o ./roles/plugins/jq


curl -L https://github.com/containers/skopeo/archive/refs/tags/v${skopeo_version}.tar.gz | tar -xz && mv skopeo-${skopeo_version} ./roles/plugins/skopeo

