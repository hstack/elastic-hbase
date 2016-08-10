export REPO="${REPO:-cellos}"
export TAG=$(git rev-parse --short HEAD)
export VERSION="${VERSION:-1.2.2}"
export HBASE_DOWNLOAD_URL="${HBASE_DOWNLOAD_URL:-http://mirror.reverse.net/pub/apache/hbase/${VERSION}/hbase-${VERSION}-bin.tar.gz}"

