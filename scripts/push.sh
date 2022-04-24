#!/bin/bash

#eval $(aws ecr get-login --no-include-email --region eu-central-1)

aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 608047204010.dkr.ecr.eu-west-1.amazonaws.com

docker tag $NAME:$CI_COMMIT_TAG $AWS_ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/$NAME:$CI_COMMIT_TAG

docker push $AWS_ACCOUNT_ID.dkr.ecr.eu-west-1.amazonaws.com/$NAME:$CI_COMMIT_TAG
