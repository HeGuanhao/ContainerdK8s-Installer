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
