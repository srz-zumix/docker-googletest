FROM alpine:3.8

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=release-1.4.0
RUN env \
  && apk update && apk upgrade \
  && apk add --no-cache -q -f git cmake make g++ \
  && apk add --no-cache -q -f --virtual .builddeps automake autoconf libtool python

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
WORKDIR /gtest
RUN autoreconf -fvi \
  && ./configure \
  && make \
  && make install

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock \
  && mv /gtest /googlemock/gtest
WORKDIR /googlemock
RUN autoreconf -fvi \
  && ./configure \
  && make \
  && make install \
  && rm -rf /googlemock \
  && apk del .builddeps
