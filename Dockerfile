FROM ubuntu:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=master
RUN env \
  && apt-get update \
  && apt-get install -q -y git cmake make g++

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build \
  && cd /googletest/build \
  && cmake .. && make && make install \
  && rm -rf /googletest \
  && apt-get clean
