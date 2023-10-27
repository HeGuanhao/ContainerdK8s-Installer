#!/bin/bash

set -e

if ! ctr task ls | grep -q 'registry'; then
    echo "docker registry did not work !"
    exit 1
fi

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
            echo "Usage: ./skopeo.sh [flags [options]]..."
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

function image() {
    for image in "$@"
    do
        if echo "$image" | grep -q '/'; then
            if echo "${image%%/*}" | grep -q '\.'; then
                echo "$image"
            else
                echo "docker.io/$image"
            fi
        else
            echo "docker.io/library/$image"
        fi
    done
}

if [[ "$image" == "" ]]; then
    echo "image name is required:"
    exit 1
fi

image_name = "$(image "$image" | sed 's/"//g')"


skopeo copy --src-tls-verify=false --dest-tls-verify=false docker://$image_name docker://"127.0.0.1:5000/$(echo $image_name | sed 's|^[^\/]*\/||')"
