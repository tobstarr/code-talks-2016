#!/bin/bash
set -x

kubectl create secret tls codetalks.phraseapp.io-v1 --key ~/.lego/certificates/codetalks.phraseapp.io.key --cert ~/.lego/certificates/codetalks.phraseapp.io.crt

kubectl create configmap nginx-v1 --from-file=nginx.conf 2> /dev/null || /bin/true

set -e

kubectl apply -f nginx.dpl.yml
kubectl apply -f nginx.svc.yml
