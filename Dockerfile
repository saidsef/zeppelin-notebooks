FROM java:8-alpine
MAINTAINER Said Sef <saidsef@gmail.com> (http://saidsef.co.uk/)

LABEL version="1.0"
LABEL description="Containerised Apache Zepplin Server"

ARG ZEPPLIN_VERSION=""
ARG ZEPPELIN_PORT=""
ARG ZEPPELIN_NOTEBOOK_DIR=""
ARG ZEPPELIN_JAVA_OPTS=""
ARG BUILD_ID=""

ENV HOME /tmp
ENV ZEPPLIN_VERSION ${ZEPPLIN_VERSION:-0.7.3}
ENV ZEPPELIN_PORT ${ZEPPELIN_PORT:-8080}
ENV ZEPPELIN_NOTEBOOK_DIR ${ZEPPELIN_NOTEBOOK_DIR:-notebook}
ENV ZEPPELIN_JAVA_OPTS ${ZEPPELIN_JAVA_OPTS:-""}

WORKDIR /opt

RUN apk --update add wget && \
    echo "Downloading Apache Zeplin Version $ZEPPLIN_VERSION" && \
    wget http://apache.mirror.anlx.net/zeppelin/zeppelin-$ZEPPLIN_VERSION/zeppelin-$ZEPPLIN_VERSION-bin-all.tgz && \
    tar xvf zeppelin-$ZEPPLIN_VERSION-bin-all.tgz && \
    rm -fv zeppelin-$ZEPPLIN_VERSION-bin-all.tgz && \
    rm -rfv /var/cache/apk/* && \
    rm -rfv /tmp/*

# Build information
RUN echo ${BUILD_ID} > build_id.txt

# Apache Zepplin ports
EXPOSE 8080 8081

# Start Apache Zepplin
CMD ["/opt/zeppelin-"$ZEPPLIN_VERSION"-bin-all/bin/zeppelin.sh"]
