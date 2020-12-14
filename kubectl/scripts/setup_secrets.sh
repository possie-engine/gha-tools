#!/bin/bash

function setupSecrets() {
	# Setup kubernetes configurations
	mkdir -p ~/.kube
	echo "${kubeConfig}" >~/.kube/config
}
