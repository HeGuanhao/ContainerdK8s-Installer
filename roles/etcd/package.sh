#!/bin/bash

set -e

source ../scripts/utils.sh

etcd_version=$(getVersion "etcd")

curl -L https://github.com/etcd-io/etcd/releases/download/v"${etcd_version}"/etcd-v3.5.9-linux-amd64.tar.gzetcd-v"${version}"-linux-${ARCH}.tar.gz | tar -zxv --strip-components=1 etcd-v"${version}"-linux-${ARCH}/{etcd,etcdctl}
https://github.com/etcd-io/etcd/releases/download/v3.5.9/etcd-v3.5.9-linux-amd64.tar.gz