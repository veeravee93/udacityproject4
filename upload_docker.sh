#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=veeravee93/app

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

#docker tag <your-local-image>:<tag> <your-docker-hub-username>/<repository-name>:<tag>
sudo docker tag app:latest veeravee93/app

sudo docker login -u veeravee93@gmail.com -p @Year2024
# Step 3:
# Push image to a docker repository
#docker push <your-docker-hub-username>/<repository-name>:<tag>
sudo docker push veeravee93/app