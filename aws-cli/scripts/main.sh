#!/bin/bash

function main() {
	# Source the other files to gain access to their functions
	scriptDir=$(dirname ${0})
	source ${scriptDir}/colours.sh
	source ${scriptDir}/install.sh
	source ${scriptDir}/parse_inputs.sh
	source ${scriptDir}/setup_secrets.sh

	parseInputs
	setupSecrets
	installAWS
}
