FROM ubuntu:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=master
ENV DEBIAN_FRONTEND=noninteractive
RUN env \
  && apt-get update \
  && apt-get install -q -y git cmake make g++ lcov \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build
WORKDIR /googletest
COPY remove-testcase-api.patch remove-testcase-api.patch
RUN patch -p1 remove-testcase-api.patch
WORKDIR /googletest/build
RUN cmake .. -DCMAKE_CXX_FLAGS=-DGTEST_REMOVE_LEGACY_TEST_CASEAPI_ && make && make install
RUN mkdir -p /code
WORKDIR /code
RUN rm -rf /googletest
