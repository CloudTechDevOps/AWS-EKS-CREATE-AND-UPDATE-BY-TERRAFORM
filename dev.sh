#!/bin/bash

# Set Kubernetes version
kubernetesVersion="1.32"

# Run the eksctl command and save JSON output
eksctl utils describe-addon-versions --kubernetes-version "$kubernetesVersion" > dev.json


##  eksctl utils describe-addon-versions --kubernetes-version "1.30" > dev.json
