FROM alpine:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=master
RUN env \
  && apk update && apk upgrade \
  && apk add --no-cache -q -f git cmake make g++

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build \
  && cd /googletest/build \
  && cmake .. && make && make install \
  && rm -rf /googletest
