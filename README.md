# alpine-s3fs

Use [s3fs](https://github.com/s3fs-fuse/s3fs-fuse) with Alpine Linux to mount an S3 bucket as a directory in the filesystem.  
Uses environment variables to configure.

```shell
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY= # currently required but should be optional if IAM_ROLE is used
S3_ACL=private # default, optional
S3_BUCKET=test-bucket
IAM_ROLE= # optional IAM role name, for usage on EC2.
MOUNT_POINT=/path/to/mount # must be an empty directory
```

## Versions:

1. `rjocoleman/alpine-s3fs:latest`

  This image is plain functionality on top of a standard [`alpine:3.3`](https://hub.docker.com/_/alpine/) image.

2. `rjocoleman/alpine-s3fs:ruby2`

  This image is based on the official [`ruby:2-alpine`](https://hub.docker.com/_/ruby/) image. It includes Ruby 2.x latest on top of Alpine 3.3.
