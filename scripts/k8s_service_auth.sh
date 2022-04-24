#!/bin/bash

# Authentication script by service account
#
# First time Usage:
# ./k8s_sa.sh
#
# Later usage without creating service account
# ./k8s_sa.sh refresh
#
# Reference web page 
# Adding a Service Account Authentication Token to a Kubeconfig File
# https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengaddingserviceaccttoken.htm
#
# General documentation about authentication
# https://kubernetes.io/docs/reference/access-authn-authz/authentication/

# Variables
SERVICE_ACCOUNT_NAME=kubeconfig-sa
NAMESPACE=kube-system

# if first argument is refresh skip creating account
if [[ "$1" != "refresh" ]]
then
  # create a new service account in the kube-system namespace
  echo "Creating service account $SERVICE_ACCOUNT_NAME in $NAMESPACE namespace"
  kubectl -n $NAMESPACE create serviceaccount $SERVICE_ACCOUNT_NAME

  # Create a new clusterrolebinding with cluster administration permissions and bind it to the service account
  echo "Create a new clusterrolebinding with cluster administration permissions and bind it to the $SERVICE_ACCOUNT_NAME"
  kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=$NAMESPACE:$SERVICE_ACCOUNT_NAME
fi

# Obtain the name of the service account authentication token and assign its value to an environment variable
TOKENNAME=`kubectl -n $NAMESPACE get serviceaccount/kubeconfig-sa -o jsonpath='{.secrets[0].name}'`

# Obtain the value of the service account authentication token and assign its value (decoded from base64) to an environment variable
TOKEN=`kubectl -n $NAMESPACE get secret $TOKENNAME -o jsonpath='{.data.token}'| base64 --decode`

# Add the service account (and its authentication token) as a new user definition in the kubeconfig file
kubectl config set-credentials $SERVICE_ACCOUNT_NAME --token=$TOKEN

# Set the user specified in the kubeconfig file for the current context to be the new service account user
kubectl config set-context --current --user=$SERVICE_ACCOUNT_NAME

# Set namespace as default context
kubectl config set-context --current --namespace=$NAMESPACE