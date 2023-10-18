#!/bin/bash

# Build a Docker image from the Dockerfile
docker build -t item-app:v1 .

# List local Docker images
docker images

# Rename the image to match GitHub Packages format
docker tag item-app:v1 ghcr.io/risqikhoirul/item-app:v1

# Log in to GitHub Packages
echo $GHCR_TOKEN | docker login ghcr.io -u risqikhoirul --password-stdin

# Push the image to GitHub Packages
docker push ghcr.io/risqikhoirul/item-app:v1