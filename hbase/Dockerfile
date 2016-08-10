FROM anapsix/alpine-java:8_jdk

ARG HBASE_DOWNLOAD_URL

ADD ./hbase-site.xml /
ADD ./hadoop-lzo-0.4.20.tar.gz /

RUN \
  apk add --update --no-cache curl lzo && \
  curl -o hbase.tar.gz $HBASE_DOWNLOAD_URL && \
  tar -xzf hbase.tar.gz && \
  adduser -D -u 3434 hadoop &&\
  mkdir -p /var/log/hbase && \
  ln -sf $(ls -d */ | grep hbase) /hbase && \
  rm -f /hbase.tar.gz && \
  rm -rf /hbase/docs && \
  mv /hbase-site.xml /hbase/conf && \
  ln -s /hadoop-lzo-0.4.20/hadoop-lzo-0.4.20.jar /hbase/lib/hadoop-lzo-0.4.20.jar && \
  ln -s /hadoop-lzo-0.4.20/lib/native /hbase/lib/native && \
  chown -R hadoop:hadoop $(ls -d */ | grep hbase) /hbase /var/log/hbase && \
  chown -R hadoop:hadoop /hadoop-lzo-0.4.20 && \
  chown -R hadoop:hadoop /hbase/lib/hadoop-lzo-0.4.20.jar && \
  chown -R hadoop:hadoop /hbase/lib/native


# hbase.master.info.port
ENV PORT0=16010
# hbase.regionserver.port
ENV PORT1=16020
# hbase.regionserver.info.port
ENV PORT2=16030
# hbase.status.multicast.address.port
ENV PORT3=16100
# hbase.rest.port
ENV PORT4=8080

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


