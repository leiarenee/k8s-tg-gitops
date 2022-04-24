#!/bin/bash
[[ $k8s_dependency == false ]] && exit 0
echo "Refreshing Kubernetes Token"
profile="$1"
cluster="$2"
account_id="$3"
region="$4"
cluster_arn=arn:aws:eks:$region:$account_id:cluster/$cluster
#echo Refreshing Kube token
aws --profile $profile eks update-kubeconfig --kubeconfig .kubeconfig --name $cluster > /dev/null 2>&1 || true
#kubectl config use-context $cluster_arn || true
#echo Kube context:
#kubectl config current-context || true