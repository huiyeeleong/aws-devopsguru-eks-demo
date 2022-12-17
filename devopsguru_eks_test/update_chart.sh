#!/bin/sh

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=$(aws configure get region)

helm upgrade --set image.repository="${AWS_ACCOUNT_ID}".dkr.ecr."${REGION}".amazonaws.com/devopsguru-eks-test devopsguru-eks-test chart