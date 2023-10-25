#!/bin/bash

set -e

source ../scripts/utils.sh

yum install -y kubeadm-${version}-00 --downloaddir . --downloadonly
yum install -y kubectl-${version}-00 --downloaddir . --downloadonly
yum install -y kubelet-${version}-00 --downloaddir . --downloadonly
yum install -y ipvsadm --downloaddir . --downloadonly

yum install -y *.rpm

kubeadm config images list > ./images/kubernetes.txt