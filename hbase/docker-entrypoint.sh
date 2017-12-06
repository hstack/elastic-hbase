#!/bin/bash
set -eo pipefail

: "${HDFS_NAMENODE_ENDPOINT:?env var not set}"
: "${HDFS_NAMESPACE_ID:?env var not set}"
: "${HBASE_HDFS_ROOTDIR:?env var not set}"
: "${ZK_QUORUM:?env var not set}"
: "${HBASE_ZNODE_PARENT:?env var not set}"

sed -ie "s#HDFS_NAMESPACE_ID#$HDFS_NAMESPACE_ID#g" /hbase/conf/hbase-site.xml
sed -ie "s#HBASE_HDFS_ROOTDIR#$HBASE_HDFS_ROOTDIR#g" /hbase/conf/hbase-site.xml
sed -ie "s#ZK_QUORUM#$ZK_QUORUM#g" /hbase/conf/hbase-site.xml
sed -ie "s#HBASE_ZNODE_PARENT#$HBASE_ZNODE_PARENT#g" /hbase/conf/hbase-site.xml

#Azure optional Blob settings
sed -ie "s#AZURE_STORAGE_ACCOUNT#${AZURE_STORAGE_ACCOUNT:-'NOT_SET'}#g" /hbase/conf/hbase-site.xml
sed -ie "s#AZURE_ACCOUNT_KEY#${AZURE_ACCOUNT_KEY:-'NOT_SET'}#g" /hbase/conf/hbase-site.xml
#Azure optional ADLS settings
sed -ie "s#AZURE_ADLS_TOKEN_ENDPOINT#${AZURE_ADLS_TOKEN_ENDPOINT:-'NOT_SET'}#g" /hbase/conf/hbase-site.xml
sed -ie "s#AZURE_ADLS_CLIENT_ID#${AZURE_ADLS_CLIENT_ID:-'NOT_SET'}#g" /hbase/conf/hbase-site.xml
sed -ie "s#AZURE_ADLS_CLIENT_SECRET#${AZURE_ADLS_CLIENT_SECRET:-'NOT_SET'}#g" /hbase/conf/hbase-site.xml

exec "$@"

