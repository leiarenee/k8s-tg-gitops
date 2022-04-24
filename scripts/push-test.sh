#!/bin/bash

ts=`date +%s`

aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 608047204010.dkr.ecr.eu-west-1.amazonaws.com

docker tag dsoa-worker:testing $AWS_ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/dsoa-worker:testing-$ts

docker push $AWS_ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/dsoa-worker:testing-$ts

