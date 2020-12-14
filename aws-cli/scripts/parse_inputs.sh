#!/bin/bash

function parseInputs() {
	regex='^[0-9]+\.[0-9]+\.[0-9]+$'
	awsVersion=${INPUT_VERSION} # Default value is set to latest
	if [ "${awsVersion}" != "latest" ]; then
		[[ $awsVersion =~ $regex ]]
		if [ ${?} -ne 0 ]; then
			echo -e "${BRed}Input aws cli version should have format: xx.yy.zz, but received ${awsVersion}${NC}"
			exit 1
		fi
	fi

	awsCredentials=${INPUT_AWS_CREDENTIALS} # Default value is set to empty string
	awsConfig=${INPUT_AWS_CONFIG} # Default value is set to empty string
}
