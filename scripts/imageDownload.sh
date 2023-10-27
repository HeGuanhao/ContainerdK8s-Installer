#!/bin/bash

set -e
set -x

# Source the utils.sh script
source ./scripts/utils.sh

# create docker registry file directory
mkdir -p ./registry/var/lib/registry

# Get docker-registry version from version.ini file
registry_version=$(getVersion "docker-registry")

# pull docker registry image
echo "pulling image: docker.io/library/registry:$registry_version"
./scrpits/imagePuller.sh -i "docker.io/library/registry:$registry_version"

while IFS= read -r image_name
do
    ./scrpits/imagePuller.sh -i "$image_name"
done < "./roles/calico/images/calico.txt"

while IFS= read -r image_name
do
    ./scrpits/imagePuller.sh -i "$image_name"
done < "./roles/kubernetes/images/kubernetes.txt"