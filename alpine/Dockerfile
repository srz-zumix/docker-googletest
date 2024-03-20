FROM alpine:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=release-1.5.0
RUN env \
  && apk update && apk upgrade \
  && apk add --no-cache git cmake make g++ \
  && apk add --no-cache --virtual .builddeps automake autoconf libtool python3 2to3

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest \
  && git clone --depth=1 -b release-1.8.0 -q https://github.com/google/googletest.git /gtest-1.8.0 \
  && cp /gtest-1.8.0/googletest/scripts/fuse_gtest_files.py /gtest/scripts/fuse_gtest_files.py \
  && rm -rf /gtest-1.8.0
RUN mkdir -p /gtest/build
WORKDIR /gtest/build
RUN cmake .. \
  && make \
  && find ./ -name "*.a" | xargs -i cp -v {} /usr/local/lib \
  && [ ! -e /usr/local/include ] && mkdir -p /usr/local/include \
  ;  cp -rv /gtest/include/gtest/. /usr/local/include/gtest/

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock \
  && mv /gtest /googlemock/gtest
WORKDIR /googlemock
RUN autoreconf -fvi \
  && ./configure \
  && make \
  && make install \
  && apk del .builddeps
RUN mkdir -p /code
WORKDIR /code
RUN rm -rf /googlemock
