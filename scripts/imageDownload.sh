#!/bin/bash

set -e
set -x

# Source the utils.sh script
source ./utils.sh

# create docker registry file directory
mkdir -p ../registry/var/lib/registry

# Get docker-registry version from version.ini file
registry_version=$(getVersion "docker-registry")

# pull docker registry image
echo "pulling image: docker.io/library/registry:$registry_version"
"./imagePuller.sh -i "docker.io/library/registry:$registry_version"
