#!/bin/bash
source env.sh
docker push "${REPO}/hbase-${VERSION}:${TAG}"


