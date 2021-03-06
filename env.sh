# The default version of HBase we're building the container with
export VERSION="${VERSION:-2.2.0}"
# The docker hub repository the Docker container will be taged with and pushed to
export REPO="${REPO:-cellos}"
# Tag the container with the short version of the current git SHA
export TAG=$(git rev-parse --short HEAD)
export DOCKER_IMAGE="${REPO}/hbase:${VERSION}-${TAG}"
export HBASE_DOWNLOAD_URL="${HBASE_DOWNLOAD_URL:-http://mirror.reverse.net/pub/apache/hbase/${VERSION}/hbase-${VERSION}-bin.tar.gz}"
