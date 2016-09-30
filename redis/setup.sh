#!/bin/bash
set -ex

kubectl create configmap redis-v1 --from-file=redis.conf 2> /dev/null || /bin/true
kubectl apply -f redis.dpl.yml
kubectl apply -f redis.svc.yml
