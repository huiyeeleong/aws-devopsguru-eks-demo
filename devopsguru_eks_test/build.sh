#!/bin/sh

gradle wrapper

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=$(aws configure get region)

./gradlew bootBuildImage --imageName=devopsguru/devopsguru-eks-test

aws ecr get-login-password \
  | docker login --username AWS --password-stdin "${AWS_ACCOUNT_ID}".dkr.ecr."${REGION}".amazonaws.com

docker tag devopsguru/devopsguru-eks-test:latest "${AWS_ACCOUNT_ID}".dkr.ecr."${REGION}".amazonaws.com/devopsguru-eks-test:latest

docker push "${AWS_ACCOUNT_ID}".dkr.ecr."${REGION}".amazonaws.com/devopsguru-eks-test:latest
