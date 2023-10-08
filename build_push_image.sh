#!/bin/bash

# Build Docker image
docker build -t ghcr.io/risqikhoirul/order-service:latest .

# Menampilkan Daftar Docker images
docker images

# Log in to GitHub Container Registry
echo $GHCR_TOKEN | docker login ghcr.io -u risqikhoirul --password-stdin

# Push Docker image to GitHub Container Registry
docker push ghcr.io/risqikhoirul/order-service:latest
