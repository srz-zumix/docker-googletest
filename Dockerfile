FROM alpine:3.6

MAINTAINER srz_zumix <https://github.com/srz-zumix>

ARG BRANCH_OR_TAG=master
RUN env
RUN apk update && apk upgrade && \
  apk add --no-cache -f git cmake make g++

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build
RUN cd /googletest/build \
  && cmake .. && make && make install
RUN rm -rf /googletest
