#!/bin/sh

#build docker image from Dockerfile from current directory with name risqikhoirul/karsajobs and tag latest
docker build -t risqikhoirul/karsajobs:latest .
echo '\n\n' #print new line to give some space

# create a new image tag from source image, still refer to the same image, but have different name/tag
docker tag risqikhoirul/karsajobs:latest ghcr.io/risqikhoirul/karsajobs:latest
echo '\n\n' #print new line to give some space


# login to github packages
echo $GHCR_TOKEN | docker login ghcr.io -u risqikhoirul --password-stdin
echo '\n\n' #print new line to give some space

# push the built image to github packages
docker push ghcr.io/risqikhoirul/karsajobs:latest
echo '\n\n' #print new line to give some space
