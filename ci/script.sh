#!/bin/bash -e

if [[ "$TRAVIS_OS_NAME" = "linux" ]]; then
    sudo docker run --privileged --interactive --tty --volume $(pwd):/code malept/electron-forge-container:latest /code/ci/docker.sh $NODE_INSTALLER $BOLT_VERSION
else
    bolt
    yarn build
    yarn lint
    yarn test
fi
