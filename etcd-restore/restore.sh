#!/bin/sh

export ETCDCTL_API=3
PORT=12380
ETCDPORT=12379
CLUSTERNAME=test

echo "restoring snapshot from $1"
etcdctl snapshot restore /backup/$1 \
    --name ${CLUSTERNAME} \
    --initial-cluster test=http://localhost:${PORT} \
    --initial-cluster-token etcd-cluster-1 \
    --initial-advertise-peer-urls http://localhost:${PORT}
echo "finished restoring from snapshot $1"

echo "starting etcd cluster"
etcd --name $CLUSTERNAME --listen-client-urls http://0.0.0.0:${ETCDPORT} --advertise-client-urls http://0.0.0.0:${ETCDPORT} --listen-peer-urls http://0.0.0.0:${PORT}
