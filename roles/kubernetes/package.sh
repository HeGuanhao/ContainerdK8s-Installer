#!/bin/bash

set -e

source ./scripts/utils.sh

kubernetes_version=$(getVersion "kubernetes")

yum install -y kubeadm-${kubernetes_version} kubectl-${kubernetes_version} kubelet-${kubernetes_version} ipvsadm --downloaddir ./roles/kubernetes/ --downloadonly --disableexcludes=kubernetes

yum install -y *.rpm

kubeadm config images list > ./roles/kubernetes/images/kubernetes.txt