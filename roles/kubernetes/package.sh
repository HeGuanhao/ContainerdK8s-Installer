#!/bin/bash

set -e

source ./scripts/utils.sh

yum install -y kubeadm-${version}-00 --downloaddir ./roles/kubernetes/ --downloadonly
yum install -y kubectl-${version}-00 --downloaddir ./roles/kubernetes/ --downloadonly
yum install -y kubelet-${version}-00 --downloaddir ./roles/kubernetes/ --downloadonly
yum install -y ipvsadm --downloaddir ./roles/kubernetes/ --downloadonly

yum install -y *.rpm

kubeadm config images list > ./roles/kubernetes/images/kubernetes.txt