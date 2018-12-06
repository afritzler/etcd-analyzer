#!/bin/bash

SNAPSHOTFILE=$1
IMAGE=afritzler/etcd-restore

docker build -t $IMAGE etcd-restore/

docker run --rm -p 12380:12380 -p 12379:12379 -it -v $(cd $(dirname $SNAPSHOTFILE) && pwd):/backup $IMAGE $(basename $SNAPSHOTFILE)
