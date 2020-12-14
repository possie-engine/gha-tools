#!/bin/bash

function setupSecrets() {
	# Setup kubernetes configurations
	mkdir -p ~/.aws
	echo "${awsCredentials}" >~/.aws/credentials
	echo "${awsConfig}" >~/.aws/config
}
