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

if ! ctr task ls | grep -q 'registry'; then
    ctr run -n k8s.io -d --net-host --mount type=bind,src=/data/docker.registry/var/lib/registry,dst=/var/lib/registry docker.io/library/registry:$registry_version
fi

while IFS= read -r image_name
do
    ./scrpits/skopeo.sh -i "$image_name"
done < "./roles/calico/images/calico.txt"

while IFS= read -r image_name
do
    ./scrpits/skopeo.sh -i "$image_name"
done < "./roles/kubernetes/images/kubernetes.txt"