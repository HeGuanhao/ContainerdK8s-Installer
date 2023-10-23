#!/bin/bash

set -e
set -x

POSITIONAL=()

while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -i|--image)
            image="$2"
            shift
            shift
            ;; 
        -h|--help)
            echo "Usage: ./imagePuller.sh [flags [options]]..."
            echo
            echo "Available Flags:"
            echo "  -i, --image: (request) specify the name of the image to be pulled"
            echo "  -h, --help: print this help message"
            echo
            exit 0
            ;;
        *)
            POSITIONAL+=("$1")
            shift
            ;;
    esac
done

set -- "${POSITIONAL[@]}"

if [[ "$image" == "" ]]; then
    echo "image is required"
    exit 1
fi

if which ctr &> /dev/null; then
    echo "pull image via ctr: $image"
        ctr image pull  "$image" --skip-verify
    exit 0
fi

