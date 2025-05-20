#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables for better maintainability
DOCKERFILE_PATH="./deploy/docker/Dockerfile-build-ubuntu"
IMAGE_NAME="qgc-ubuntu-docker"
SOURCE_DIR="$(pwd)"
BUILD_DIR="${SOURCE_DIR}/build"
CONTAINER_NAME="qgc-dev"

export CONTAINER_GID=$(id -g)
export CONTAINER_UID=$(id -u)
export CONTAINER_USER=$USER

# Run the Docker container with necessary permissions and volume mounts
docker run -dit \
    --name "${CONTAINER_NAME}" \
    --privileged \
    --cap-add SYS_ADMIN \
    --device /dev/fuse \
    --security-opt apparmor:unconfined \
    -v "${SOURCE_DIR}:/project/source" \
    -v "${BUILD_DIR}:/project/build" \
    --user $(id -u):$(id -g) \
    "${IMAGE_NAME}" \
    /bin/bash
