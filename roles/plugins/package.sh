#!/bin/bash

set -e

source ./scripts/utils.sh

jq_version=$(getVersion "jq")

curl -L https://github.com/jqlang/jq/releases/download/jq-1.7/jq-linux-${ARCH} -o ./roles/plugins/jq


