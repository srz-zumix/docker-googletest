FROM alpine:3.6

MAINTAINER srz_zumix <zumix.cpp@gmail.com>

ARG BRANCH_OR_TAG=master
RUN apk add --no-cache -q -f git cmake make g++

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build
RUN cd /googletest/build \
  && cmake .. && make && make install
RUN rm -rf /googletest
