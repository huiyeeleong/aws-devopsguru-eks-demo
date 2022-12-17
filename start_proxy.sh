#!/bin/sh

#Prometheus

export POD_NAME=$(kubectl get pods --namespace default -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace default port-forward $POD_NAME 9090 &
kubectl --namespace chaos-testing port-forward svc/chaos-dashboard 2333:2333 &


#Dashboard
kubectl proxy &

