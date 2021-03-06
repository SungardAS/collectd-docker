set -ex

if [ -z "$1" ]
  then
    CMD=patch
else
    CMD=$1
fi

# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=sungardas
# image name
IMAGE=collectd-docker

# ensuring we're up to date
git pull

# bump version
docker run --rm -v "$PWD":/app treeder/bump $CMD
version=`cat VERSION`
echo "version: $version"

# run build
./build.sh

# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags
echo "finished git"
echo "tagging docker images"
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version-ubuntu16.04
docker tag $USERNAME/$IMAGE:ubuntu14.04 $USERNAME/$IMAGE:$version-ubuntu14.04
echo "finished tagging docker images"
# push it
echo "pushing to docker"
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version-ubuntu16.04
docker push $USERNAME/$IMAGE:$version-ubuntu14.04
echo "finished pushing to docker"

echo "done"


