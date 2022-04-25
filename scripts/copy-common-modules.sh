#!/bin/bash


parent_terragrunt_dir=$1
cp -R $parent_terragrunt_dir/scripts .

if [[ $k8s_dependency != false ]]
then
  cp -R $parent_terragrunt_dir/aws/terraform/modules/deploy-yaml .
  cp -R $parent_terragrunt_dir/aws/terraform/modules/k8s-yaml .
  cp $parent_terragrunt_dir/aws/terraform/modules/k8s-provider/k8s-provider.tf .
fi
