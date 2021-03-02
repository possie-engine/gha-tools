#!/bin/bash

function setupSecrets() {
	# Setup kubernetes configurations
  echo -e "${BGreen}Setting up AWS Credentials...${NC}"
	mkdir -p ~/.aws
	echo "${awsCredentials}" >~/.aws/credentials
	echo "${awsConfig}" >~/.aws/config
}
