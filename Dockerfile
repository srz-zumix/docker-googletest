FROM ubuntu:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

RUN env \
  && apt-get update \
  && apt-get install -y -q git cmake make g++ lcov \
  && apt-get install -y -q automake autoconf libtool python-is-python3 \
  && apt-get clean

ARG BRANCH_OR_TAG=release-1.0.0
RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
WORKDIR /gtest
RUN autoreconf -fvi && \
  ./configure && \
  make && \
  make install

RUN mkdir -p /code
WORKDIR /code
RUN rm -rf /gtest
