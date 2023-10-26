#!/bin/bash

set -e

source ./scripts/utils.sh

kubernetes_version=$(getVersion "kubernetes")

yum install -y kubeadm-${kubernetes_version} --downloaddir ./roles/kubernetes/ --downloadonly --disableexcludes=kubernetes
yum install -y kubectl-${kubernetes_version} --downloaddir ./roles/kubernetes/ --downloadonly --disableexcludes=kubernetes
yum install -y kubelet-${kubernetes_version} --downloaddir ./roles/kubernetes/ --downloadonly --disableexcludes=kubernetes
yum install -y ipvsadm --downloaddir ./roles/kubernetes/ --downloadonly

yum install -y *.rpm

kubeadm config images list > ./roles/kubernetes/images/kubernetes.txt