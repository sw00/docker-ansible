FROM alpine:3.5
MAINTAINER Sett <sett.wai@gmail.com>

RUN apk add --update --no-cache \
	build-base python2 python2-dev py2-pip libffi-dev openssl-dev
RUN pip install -U ansible

WORKDIR "/workspace"
ENTRYPOINT ["/usr/bin/ansible"]
