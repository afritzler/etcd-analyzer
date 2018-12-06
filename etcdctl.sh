#!/bin/bash

docker run -e ETCDCTL_API=3 --net=host --rm -it quay.io/coreos/etcd etcdctl --endpoints=localhost:12379 $@

