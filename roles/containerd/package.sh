#!/bin/bash

set -e

source ../scripts/utils.sh

mkdir -p /tmp/containerd

yum install -y containerd --downloaddir . --downloadonly

cp *.rpm /tmp/containerd/
cd /tmp/containerd/ && yum install -y *.rpm && cd - 
rm -rf /tmp/containerd

mkdir -p /etc/containerd && containerd config default > /etc/containerd/config.toml
sed -i 's#SystemdCgroup = false#SystemdCgroup = true#g' /etc/containerd/config.toml

systemctl enable containerd
systemctl restart containerd