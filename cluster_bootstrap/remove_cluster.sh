#!/bin/sh


#Detach opentelemetry role
ROLE_NAME=$(echo $(kubectl -n kube-system get cm -o yaml aws-auth | grep rolearn) | awk -F'role/' '{print $2}')
aws iam detach-role-policy \
--policy-arn arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy \
--role-name $ROLE_NAME

eksctl delete cluster --name DevOpsGuruTestCluster