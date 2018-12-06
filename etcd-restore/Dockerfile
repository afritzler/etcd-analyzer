FROM quay.io/coreos/etcd:v3.3.10

COPY restore.sh /restore.sh

EXPOSE 12380
EXPOSE 12379

ENTRYPOINT [ "/restore.sh" ]
