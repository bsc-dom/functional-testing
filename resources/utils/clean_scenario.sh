#!/bin/bash
function remove_containers {
  IMAGE=$1
  CONTAINERS=$(docker ps -a | grep "$IMAGE" | awk '{print $1}')
  for container in $CONTAINERS; do
    echo "==> Removing $container"
    docker rm -v -f $container
  done
}
echo "==> Cleaning scenario"
remove_containers "dom-ci.bsc.es/bscdataclay/logicmodule"
remove_containers "dom-ci.bsc.es/bscdataclay/dsjava"
remove_containers "dom-ci.bsc.es/bscdataclay/dspython"
remove_containers "dom-ci.bsc.es/bscdataclay/client"
remove_containers "dom-ci.bsc.es/bscdataclay/initializer"
rm -rf /testing/stubs/*
rm -rf /testing/dbfiles/*
rm -rf stubs/*
echo "<== Clean!"