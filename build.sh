set -ex

# docker hub username
USERNAME=sungardas
# image name
IMAGE=collectd-docker

docker build -t $USERNAME/$IMAGE:ubuntu14.04 -f Dockerfile_ubuntu14.04 .

docker build -t $USERNAME/$IMAGE:ubuntu16.04 -t $USERNAME/$IMAGE:latest .

