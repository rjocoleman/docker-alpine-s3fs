.PHONY: build push shell build-ruby release-ruby all

all: build release build-ruby release-ruby

build:
	@docker build -t rjocoleman/alpine-s3fs:latest .

release:
	@docker push rjocoleman/alpine-s3fs:latest

shell:
	@docker run -t -i rjocoleman/alpine-s3fs:latest /bin/bash

build-ruby:
	# create a Dockerfile version with a different source image, delete it afterwards
	@sed -e 's/alpine:3.3/ruby:2-alpine/' Dockerfile > Dockerfile-ruby2
	@docker build -t rjocoleman/alpine-s3fs:ruby2 -f Dockerfile-ruby2 .
	@rm Dockerfile-ruby2

release-ruby:
	@docker push rjocoleman/alpine-s3fs:ruby2
