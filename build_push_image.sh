#!/bin/bash

# Membangun Docker image untuk layanan pengiriman
docker build -t ghcr.io/risqikhoirul/shipping-service:latest .

# Menampilkan daftar Docker images
docker images

# Login ke GitHub Container Registry
echo $GHCR_TOKEN | docker login ghcr.io -u risqikhoirul --password-stdin

# Mendorong Docker image ke GitHub Container Registry
docker push ghcr.io/risqikhoirul/shipping-service:latest
