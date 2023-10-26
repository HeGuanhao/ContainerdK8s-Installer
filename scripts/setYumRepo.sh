#!/bin/bash

set -e

repo_file="/etc/yum.repos.d/docker-ce.repo"

if [ ! -f "$repo_file" ]; then
    cat << EOF | sudo tee "$repo_file"
[docker-ce-stable]
name=Docker CE Stable - \$basearch
baseurl=https://mirrors.aliyun.com/docker-ce/linux/centos/\$releasever/\$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://mirrors.aliyun.com/docker-ce/linux/centos/gpg
EOF
    echo "docker-ce.repo file added successfully."
else
    echo "docker-ce.repo file already exists. No changes made."
fi

repo_file="/etc/yum.repos.d/kubernetes.repo"

if [ ! -f "$repo_file" ]; then
    cat << EOF | sudo tee "$repo_file"
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=http://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg http://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF
    echo "kubernetes.repo file added successfully."
else
    echo "kubernetes.repo file already exists. No changes made."
fi