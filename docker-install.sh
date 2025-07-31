#!/bin/bash
# Docker Container + vLLM setup for Linux Ubuntu OS
# ===============================================================
# This script automates the setup of a Docker environment on a Linux system.
# It installs required dependencies, adds the official Docker repository, installs Docker Engine and Docker Compose,
# and configures user permissions to allow non-root access. The script ensures that Docker starts on boot and
# verifies the installation with a test container.
#
# Requirements
# OS:                   Ubuntu 24.04.2 (noble numbat)
# Driver:               ROCm 6.4.1
#
# Software
# Docker:               28.2.2
# Release:              https://docs.docker.com/engine/release-notes/
# vLLM release:         https://hub.docker.com/r/rocm/vllm
# vLLM:                 0.9.0.2.dev108+g71faa1880.rocm641
#
# Author: Joerg Roskowetz
# Script process time: ~15 minutes (depending on system and internet configuration)
# Date: May 21st 2025

# global stdout method
function print () {
    printf "\033[1;36m\t$1\033[1;35m\n"; sleep 3
}

clear
print '\nInstalling and configuring a Docker environment (stable version) with required dependencies and the official Docker repository, installs Docker Engine and Docker Compose and configures user permissions to allow non-root access\n'

# Update your package list
sudo apt update

# Install required dependencies
sudo apt install apt-transport-https ca-certificates curl software-properties-common --yes

# Add the Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io --yes

# Add your user to the "docker" group (optional, to run Docker without "sudo")
sudo usermod -a -G docker ${SUDO_USER:-$USER}

# Verify the Docker installation
docker --version

# Restart Docker
sudo service docker restart

# vLLM docker container setup
#sudo docker pull rocm/vllm

print '\nStart the docker image by running: sudo docker run -it --device=/dev/kfd --device=/dev/dri --security-opt seccomp=unconfined --group-add video rocm/vllm\n'
print '\nIt will run the container using the image rocm/vllm, with specific flags to allow access to AMD GPU hardware via ROCm.\n'
