#!/bin/sh

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=$(aws configure get region)

aws ecr get-login-password \
  | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID".dkr.ecr."${REGION}".amazonaws.com

aws ecr create-repository --repository-name devopsguru-eks-test --image-scanning-configuration scanOnPush=true
