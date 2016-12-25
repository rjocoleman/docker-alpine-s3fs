FROM alpine:edge

# the following ENV need to be present
ENV IAM_ROLE=none
ENV MOUNT_POINT=/var/s3
VOLUME /var/s3

ARG S3FS_VERSION=v1.80
# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="Alpine/s3fs - Alpine Linux image w/Amazon S3 Support through Fuse-s3fs" \
#  org.label-schema.description="Let it be pulled from Readme.md..." \
  org.label-schema.url="https://github.com/rjocoleman/docker-alpine-s3fs/wiki" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url=$VCS_URL \
  org.label-schema.vendor="Robert Coleman <github@robert.net.nz>" \
  org.label-schema.version=$VERSION \
  org.label-schema.schema-version="1.0"
RUN apk update && apk upgrade \
  && apk add  --no-cache ca-certificates fuse libcurl libxml2 bash \
  && apk add --no-cache --virtual .build-dependencies \
	alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev git \
  && git clone https://github.com/s3fs-fuse/s3fs-fuse.git \
  && cd s3fs-fuse && git checkout tags/${S3FS_VERSION} \
  && ./autogen.sh && ./configure --prefix=/usr && make && make install && cd .. \
  && apk del .build-dependencies && rm -rf /var/cache/* s3fs-fuse

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
