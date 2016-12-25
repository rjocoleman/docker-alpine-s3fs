# alpine-s3fs
[![Docker Automated buil](https://img.shields.io/docker/automated/rjocoleman/alpine-s3fs.svg)](https://hub.docker.com/r/rjocoleman/alpine-s3fs/) [![](https://images.microbadger.com/badges/image/rjocoleman/alpine-s3fs.svg)](https://microbadger.com/images/rjocoleman/alpine-s3fs "Get your own image badge on microbadger.com") [![Docker Pulls](https://img.shields.io/docker/pulls/rjocoleman/alpine-s3fs.svg)](https://hub.docker.com/r/rjocoleman/alpine-s3fs/) [![Docker Stars](https://img.shields.io/docker/stars/rjocoleman/alpine-s3fs.svg)](https://hub.docker.com/r/rjocoleman/alpine-s3fs/) [![](https://images.microbadger.com/badges/commit/rjocoleman/alpine-s3fs.svg)](https://microbadger.com/images/rjocoleman/alpine-s3fs "Get your own commit badge on microbadger.com")

Use [s3fs](https://github.com/s3fs-fuse/s3fs-fuse) with Alpine Linux to mount an S3 bucket as a directory in the filesystem.  
Uses environment variables to configure.

```shell
AWS_ACCESS_KEY_ID= # required unless IAM_ROLE is set
AWS_SECRET_ACCESS_KEY= # required unless IAM_ROLE is set
S3_ACL=private # default, optional
S3_BUCKET=test-bucket # required
IAM_ROLE= # optional IAM role name, for usage on EC2.
```

## Versions:

1. `rjocoleman/alpine-s3fs:latest`

  This image is plain functionality on top of a standard [`alpine:3.3`](https://hub.docker.com/_/alpine/) image.

2. `rjocoleman/alpine-s3fs:ruby2`

  This image is based on the official [`ruby:2-alpine`](https://hub.docker.com/_/ruby/) image. It includes Ruby 2.x latest on top of Alpine 3.3.


## Usage

As a base image for a container. ENV `MOUNT_POINT` can be changed to direct the mount point to a different directory as required.
It should be noted that recent versions of Docker have clamped down on privileges within docker images so you'll likely need to run the image with the `--privileged` argument in order to allow s3fs access to the /dev/flash device within the image.

### Note

_Exporting_ Fuse based mounts as data volumes using the `--volumes-from` command doesn't work (this is a Docker thing).
