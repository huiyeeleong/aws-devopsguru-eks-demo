#!/bin/sh

helm repo add chaos-mesh https://charts.chaos-mesh.org

kubectl create namespace chaos-testing

helm install chaos-mesh chaos-mesh/chaos-mesh --namespace chaos-testing --version 2.3.0