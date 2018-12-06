#!/bin/bash

docker build -t afritzler/apiserver apiserver/

docker run --net=host --rm -it afritzler/apiserver kube-apiserver \
  --etcd-servers http://localhost:12379 \
  --storage-media-type='application/json' \
  --authorization-mode "ABAC" \
  --authorization-policy-file "/abac.json"


