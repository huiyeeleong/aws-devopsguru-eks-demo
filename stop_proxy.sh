#!/bin/sh


ps axf | grep 'kubectl proxy' | grep -v grep | awk '{print "kill -9 " $1}' | sh
ps axf | grep 'kubectl --namespace default port-forward' | grep -v grep | awk '{print "kill -9 " $1}' | sh
ps axf | grep 'kubectl --namespace chaos-testing port-forward' | grep -v grep | awk '{print "kill -9 " $1}' | sh