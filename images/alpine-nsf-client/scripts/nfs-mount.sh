#!/usr/bin/with-contenv /bin/bash

rpcbind

for entry in $( echo "$NFS_SERVERS" | tr "," "\n" ); do
  SERVER=($(echo "$entry" | tr ":" "\n"))

  if [ ! -d $entry ]; then
    mkdir -p "/mnt/shares/${SERVER[2]}"
  fi

  mount -t nfs4 ${SERVER[0]}:${SERVER[1]} "/mnt/shares/${SERVER[2]}"
  echo "NFS ${SERVER[0]} Mounted @ /mnt/shares/${SERVER[2]}"
done
