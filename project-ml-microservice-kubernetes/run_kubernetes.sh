#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=joshvi/app

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment kubernetes-udaproj4 --image=joshvi/app

# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods

# Step 4:
# Forward the container port to a host
#kubectl port-forward <pod-name> <local-port>:<remote-port>
kubectl port-forward pod/kubernetes-udaproj4-7c6696fb75-kp4d6 --address 0.0.0.0 8000:80