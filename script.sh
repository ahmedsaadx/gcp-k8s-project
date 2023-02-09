#!/bin/bash

sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin kubectl  -y
gcloud container clusters get-credentials private --zone us-east1-b --project saad-375811


 
