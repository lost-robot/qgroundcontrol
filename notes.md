# build
git submodule update --init --recursive
cd repo
mkdir build
./deploy/docker/run-docker-ubuntu.sh

- made edits to Dockerfile and build command to ensure user id and group id were consistent with host



<!-- docker run --rm \
  --privileged \
  --device /dev/fuse \
  -u $(id -u):$(id -g) \
  -v ${PWD}:/project/source \
  -v ${PWD}/build:/project/build \
  qgc-linux-docker -->

