#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables for better maintainability
DOCKERFILE_PATH="./deploy/docker/Dockerfile-build-ubuntu"
IMAGE_NAME="qgc-ubuntu-docker"
SOURCE_DIR="$(pwd)"
BUILD_DIR="${SOURCE_DIR}/build"

export CONTAINER_GID=$(id -g)
export CONTAINER_UID=$(id -u)
export CONTAINER_USER=$USER

# Build the Docker image
docker build --file "${DOCKERFILE_PATH}" \
    --build-arg CONTAINER_USER=$CONTAINER_USER \
    --build-arg CONTAINER_UID=$CONTAINER_UID \
    --build-arg CONTAINER_GID=$CONTAINER_GID \
    -t "${IMAGE_NAME}" "${SOURCE_DIR}"