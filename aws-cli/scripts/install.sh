#!/bin/bash

# The folder to save the downloaded binaries
mkdir -p ~/bin
export PATH=~/bin:$PATH

function installAWS() {
	# Get the appropriate terraform version
	if [[ "${awsVersion}" == "latest" ]]; then
		echo "Using the latest version of aws-cli"
		url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
	else
		echo "Using the input version of aws-cli: v${awsVersion}"
		url="https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${awsVersion}.zip"
	fi

	echo "Downloading aws-cli v${awsVersion}"
	mkdir -p ~/aws-cli/downloads
	curl -s -S -L ${url} -o ~/aws-cli/downloads/awscli.zip
	if [ "${?}" -ne 0 ]; then
		echo -e "${BRed}Failed to download aws-cli v${awsVersion}${NC}"
		exit 1
	fi
	echo -e "${BGreen}Successfully downloaded aws-cli v${awsVersion}${NC}"

	echo "Unzipping aws-cli ${awsVersion}"
	unzip -d ~/aws-cli ~/aws-cli/downloads/awscli.zip &> /dev/null
	if [ "${?}" -ne 0 ]; then
		echo -e "${BRed}Failed to unzip aws-cli v${awsVersion}${NC}"
		exit 1
	fi
	echo -e "${BGreen}Successfully unzipped aws-cli v${awsVersion}${NC}"

	echo "Installing aws-cli ${awsVersion}"
	chmod +x ~/aws-cli/aws/install
	mkdir -p ~/aws-cli/cli
	~/aws-cli/aws/install -i ~/aws-cli/cli -b ~/bin
	if [ "${?}" -ne 0 ]; then
		echo -e "${BRed}Failed to install aws-cli v${awsVersion}${NC}"
		exit 1
	fi
	echo -e "${BGreen}Successfully installed aws-cli v${awsVersion}${NC}"
}
