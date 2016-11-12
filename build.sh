#!/bin/bash
source env.sh
docker build --build-arg HBASE_DOWNLOAD_URL="${HBASE_DOWNLOAD_URL}" --rm -t "${DOCKER_IMAGE}" ./hbase
