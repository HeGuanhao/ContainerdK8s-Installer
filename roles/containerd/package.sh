#!/bin/bash

set -e

source ./scripts/utils.sh

yum install -y containerd --downloaddir ./roles/containerd/ --downloadonly

yum install -y ./roles/containerd/*.rpm

mkdir -p /etc/containerd && containerd config default > /etc/containerd/config.toml
sed -i 's#SystemdCgroup = false#SystemdCgroup = true#g' /etc/containerd/config.toml

systemctl enable containerd
systemctl restart containerd