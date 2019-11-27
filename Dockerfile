FROM ubuntu:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=release-1.6.0
RUN env \
  && apt-get update \
  && apt-get install -q -y git cmake make g++ \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
RUN mkdir -p /gtest/build
WORKDIR /gtest/build
RUN cmake .. && make && find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib \
    && cp -rv /gtest/include/gtest/. /usr/local/include/gtest/ \
    && rm -rf /gtest

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock
RUN mkdir -p /googlemock/build
WORKDIR /googlemock/build
RUN cmake .. && make && find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib \
    && cp -rv /googlemock/include/gmock/. /usr/local/include/gmock/ \
    && rm -rf /googlemock
