#!/bin/bash
set -eo pipefail

if [ -z "$HDFS_NAMENODE_ENDPOINT" ]; then
  echo >&2 'You need to specify HDFS_NAMENODE_ENDPOINT environment var.'
  exit 1
fi

if [ -z "$HDFS_NAMESPACE_ID" ]; then
  echo >&2 'You need to specify HDFS_NAMESPACE_ID environment var.'
  exit 1
fi

if [ -z "$HBASE_HDFS_ROOTDIR" ]; then
  echo >&2 'You need to specify HBASE_HDFS_ROOTDIR environment var.'
  exit 1
fi

if [ -z "$ZK_QUORUM" ]; then
  echo >&2 'You need to specify ZK_QUORUM environment var.'
  exit 1
fi

if [ -z "$HBASE_ZNODE_PARENT" ]; then
  echo >&2 'You need to specify HBASE_ZNODE_PARENT environment var.'
  exit 1
fi

sed -ie "s#HDFS_NAMESPACE_ID#$HDFS_NAMESPACE_ID#g" /hbase/conf/hbase-site.xml
sed -ie "s#HBASE_HDFS_ROOTDIR#$HBASE_HDFS_ROOTDIR#g" /hbase/conf/hbase-site.xml
sed -ie "s#ZK_QUORUM#$ZK_QUORUM#g" /hbase/conf/hbase-site.xml
sed -ie "s#HBASE_ZNODE_PARENT#$HBASE_ZNODE_PARENT#g" /hbase/conf/hbase-site.xml

exec "$@"

