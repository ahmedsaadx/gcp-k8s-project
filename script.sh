#!/bin/bash
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin kubectl wget
wget https://github.com/kubernetes/kompose/releases/download/v1.28.0/kompose_1.28.0_amd64.deb 
sudo apt install ./kompose_1.28.0_amd64.deb    
