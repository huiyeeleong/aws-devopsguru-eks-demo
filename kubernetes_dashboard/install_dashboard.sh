#!/bin/sh

<<<<<<< HEAD
=======

>>>>>>> 421212f (Added new eks deployment)
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
helm install kube-dashboard kubernetes-dashboard/kubernetes-dashboard -f values.yaml