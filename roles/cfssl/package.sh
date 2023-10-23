#!/bin/bash

set -e

source ../scripts/utils.sh

cfssl_version=$(getVersion "cfssl")

curl -L https://github.com/cloudflare/cfssl/releases/download/"v${cfssl_version}"/cfssl_"${cfssl_version}"_linux_"${ARCH}" cfssl
curl -L https://github.com/cloudflare/cfssl/releases/download/"v${cfssl_version}"/cfssljson_"${cfssl_version}"_linux_"${ARCH}" cfssljson
curl -L https://github.com/cloudflare/cfssl/releases/download/"v${cfssl_version}"/cfssl-bundle_"${cfssl_version}"_linux_"${ARCH}" cfssl-bundle
curl -L https://github.com/cloudflare/cfssl/releases/download/"v${cfssl_version}"/cfssl-certinfo_"${cfssl_version}"_linux_"${ARCH}" cfssl-certinfo
curl -L https://github.com/cloudflare/cfssl/releases/download/"v${cfssl_version}"/cfssl-newkey_"${cfssl_version}"_linux_"${ARCH}" cfssl-certnewkey
curl -L https://github.com/cloudflare/cfssl/releases/download/"v${cfssl_version}"/cfssl-scan_"${cfssl_version}"_linux_"${ARCH}" cfssl-scan

