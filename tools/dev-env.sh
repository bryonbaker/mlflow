#! /bin/bash

podman run -it --rm --net host -v ${HOME}/.kube/:/root/.kube:Z -v ${PWD}:/work:Z -w /work quay.io/bryonbaker/helm-env:latest


