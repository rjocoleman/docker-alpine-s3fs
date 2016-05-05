FROM alpine:3.3

# the following ENV need to be present
ENV IAM_ROLE=none

ARG S3FS_VERSION=1.79

RUN apk --update add fuse alpine-sdk automake autoconf libxml2-dev fuse-dev curl-dev git bash;
RUN git clone https://github.com/s3fs-fuse/s3fs-fuse.git; \
 cd s3fs-fuse; \
 ./autogen.sh; \
 ./configure --prefix=/usr; \
 make; \
 make install; \
 rm -rf /var/cache/apk/*;

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
