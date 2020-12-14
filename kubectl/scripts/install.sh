#!/bin/bash

# The folder to save the downloaded binaries
mkdir -p ~/bin
export PATH=~/bin:$PATH

function installKubectl() {
	# Get the appropriate terraform version
	if [[ "${kubectlVersion}" == "latest" ]]; then
		echo "Checking the latest version of Kubectl"
		kubectlVersion=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)

		if [[ -z "${kubectlVersion}" ]]; then
			echo -e "${BRed}Failed to fetch the latest kubectl version${NC}"
			exit 1
		fi
	else
		kubectlVersion="v${kubectlVersion}"
		echo "Using the input version of kubectl: ${kubectlVersion}"
	fi

	url="https://storage.googleapis.com/kubernetes-release/release/${kubectlVersion}/bin/linux/amd64/kubectl"

	echo "Downloading Kubectl ${kubectlVersion}"
	curl -s -S -L ${url} -o /tmp/kubectl
	if [ "${?}" -ne 0 ]; then
		echo -e "${BRed}Failed to download kubectl ${kubectlVersion}${NC}"
		exit 1
	fi
	echo -e "${BGreen}Successfully downloaded kubectl ${kubectlVersion}${NC}"

	echo "Moving kubectl ${kubectlVersion} to PATH"
	chmod +x /tmp/kubectl
	mv /tmp/kubectl ~/bin/kubectl
	if [ "${?}" -ne 0 ]; then
		echo -e "${BRed}Failed to move kubectl ${kubectlVersion}${NC}"
		exit 1
	fi
	echo -e "${BGreen}Successfully moved kubectl ${kubectlVersion}${NC}"
}
