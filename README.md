[![CircleCI](https://dl.circleci.com/status-badge/img/gh/veeravee93/udacityproject4/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/veeravee93/udacityproject4/tree/main)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

**Files in the repository**
.circleci: contains the circle ci build yml file
output_txt_files: contains terminal output of the predict end point, docker_out.txt and kubernetes_out.txt
Dockerfile: The Dockerfile contains all the commands a user could call on the command line to assemble an image
Makefile: Makefile with the following steps: make setup, make install, make test, make lint and make all.
app.py: Python code which has the prdict endpint 
make_prediction.sh: Contains curl commands which executes post method predict
requirements.txt: Install all the neccessary dependencies for project
run_docker.sh : to buid a docker image and run on the desired port
run_kubernetes.sh : deploying container into kubernetes cluster
upload_docker.sh: To tag the docker image and to push to docker hub using login

## Setup the Environment

Clone the repository
git clone https://github.com/harishbabua/project-ml-microservice-kubernetes.git

cd project-ml-microservice-kubernetes

Create and activate pyhton environment
# You should have Python 3.7 available in your host.
# Check the Python path using `which python3`
python3 -m venv ~/.devops

source ~/.devops/bin/activate
Run make install to install the necessary dependencies
create a docker account using the link Dockerhub
Setup and Configure Docker locally
install docker using below steps using link [dockerinstallubuntu] (https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
# Install using the Apt repository  Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update`
To install the latest version, run:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
Verify that the Docker Engine installation is successful by running the hello-world image.
sudo docker run hello-world
**Kubernetes Steps**
**Setup and Configure Kubernetes locally**
  #Execute the below commands
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

    chmod +x kubectl

    sudo mv kubectl /usr/local/bin/

    kubectl version --client
install minikube locally refer the link below minikube
Step 1. Apply updates
sudo apt update -y
sudo apt upgrade -y
Once all the updates are installed then reboot your system once.

sudo reboot
Step 2. Install Minikube dependencies Install the following minikube dependencies by running beneath command,
sudo apt install -y curl wget apt-transport-https
Step 3. Download Minikube Binary Use the following curl command to download latest minikube binary,
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
Once the binary is downloaded, copy it to the path /usr/local/bin and set the executable permissions on it
  sudo install minikube-linux-amd64 /usr/local/bin/minikube
Verify the minikube version
  minikube version
Step 4. Install Kubectl utility
  curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-  release/release/stable.txt`/bin/linux/amd64/kubectl
Once kubectl is downloaded then set the executable permissions on kubectl binary and move it to the path /usr/local/bin.
  chmod +x kubectl
  sudo mv kubectl /usr/local/bin/
Now verify the kubectl version
  kubectl version -o yaml
Step 5. Start minikube
  $ minikube start --driver=docker
Run below minikube command to check status,
  minikube status
Run following kubectl command to verify the Kubernetes version, node status and cluster info.
  $ kubectl cluster-info
  $ kubectl get nodes
**Create Flask app in Container**
**Task 1: Complete the Dockerfile and run ./run_docker.sh**
  Step 1: Create a working directory
  Step 2: Copy source code to working directory
  Step 3:Install packages from requirements.txt
  Step 4: Expose port 80
  Step 5: Run app.py at container launch
**Task 2: Run a Container**
  In order to run a containerized application, you’ll need to build and run the docker image that you defined in the Dockerfile

**Complete the following steps to get Docker running locally**
  Step 1: Build image and add a descriptive tag
  Step 2: List docker images
  Step 3: Run flask app
Test the container by executing the file ./make_prediction.sh

**Task 3: Upload your Docker image**
To upload an image to docker, you’ll need to complete the upload_docker.sh

**Assumes that an image is built via run_docker.sh**
  Step 1:Create dockerpath
  Step 2: Authenticate & tag
  Step 3: Push image to a docker repository

**Run via kubectl**
This tags and uploads an image to Docker Hub
  Step 1: This is your Docker ID/path
  Step 2: Run the Docker Hub container with kubernetes
  Step 3: List kubernetes pods
  Step 4: Forward the container port to a host
**Running app.py**
  Standalone: python app.py
  Run in Docker: ./run_docker.sh
  Run in Kubernetes: ./run_kubernetes.sh
