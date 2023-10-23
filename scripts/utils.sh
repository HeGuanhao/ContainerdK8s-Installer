#!/bin/bash

set -e

#!/bin/bash

# Function to get value of a parameter from version.ini file
function getVersion() {
  local param=$1
  local version_file="./version.ini"

  if [[ -f $version_file ]]; then
    local value=$(grep "^${param}:" "$version_file" | cut -d ":" -f 2- | sed 's/^[[:space:]]*//')
    echo "$value"
  else
    echo "Error: $version_file not found."
    exit 1
  fi
}
