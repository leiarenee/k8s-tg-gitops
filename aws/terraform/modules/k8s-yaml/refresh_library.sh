#!/bin/bash
# Refreshes library content with latest kubernets api library

lst=$(ls k8s.*.tf 2>/dev/null)
set -e
[[ ! -z $lst ]] && echo "$lst" | xargs rm
echo -e "provider \"kubernetes\" {\n}" > tmp.tf
terraform init
terraform providers schema -json | jq . > provider.json 
rm tmp.tf
python3 prepare.py