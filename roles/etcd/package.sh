#!/bin/bash

set -e

source ../scripts/utils.sh

etcd_version=$(getVersion "etcd")

curl -L https://github.com/etcd-io/etcd/releases/download/v"${etcd_version}"/etcd-v"${etcd_version}"-linux-${ARCH}.tar.gz | tar -zxv --strip-components=1 etcd-v"${etcd_version}"-linux-${ARCH}/{etcd,etcdctl}

