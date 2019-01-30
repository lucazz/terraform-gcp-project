#!/bin/bash
set -euf -o pipefail

declare -a files=(
	"examples/terraform.tfstate"
	"examples/terraform.tfstate.backup"
	"examples/.terraform.tfstate.lock.info"
	"examples/plan"
	)

if [ -d "examples/.terraform/" ]; then
	cd examples
	terraform destroy \
		-auto-approve
	rm -rfv .terraform
	cd ..
fi

if [ -f "examples/plan" ] || [ -f "examples/*.tfstate*" ] ; then
	for file in "${files[@]}"; do
		rm -rfv $file
	done
fi
