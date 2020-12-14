#!/bin/bash

function parseInputs() {
	regex='^[0-9]+\.[0-9]+\.[0-9]+$'
	kubectlVersion=${INPUT_VERSION} # Default value is set to latest
	if [ "${kubectlVersion}" != "latest" ]; then
		[[ $kubectlVersion =~ $regex ]]
		if [ ${?} -ne 0 ]; then
			echo -e "${BRed}Input kubectl version should have format: xx.yy.zz, but received ${kubectlVersion}${NC}"
			exit 1
		fi
	fi

	kubeConfig=${INPUT_KUBE_CONFIG} # Default value is set to empty string
}
