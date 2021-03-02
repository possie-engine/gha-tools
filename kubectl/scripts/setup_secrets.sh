#!/bin/bash

function setupSecrets() {
	# Setup kubernetes configurations
  echo -e "${BGreen}Setting up kubeconfig...${NC}"
	mkdir -p ~/.kube
	echo "${kubeConfig}" >~/.kube/config
}
