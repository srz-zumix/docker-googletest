FROM alpine:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

RUN env \
  && apk update && apk upgrade \
  && apk add --no-cache git cmake make g++ \
  && apk add --no-cache --virtual .builddeps automake autoconf libtool

ARG BRANCH_OR_TAG=release-1.1.0
ARG GMOCK_BRANCH_OR_TAG=release-1.0.0
RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
COPY patch /tmp/patch
RUN git -C /gtest apply /tmp/patch/$BRANCH_OR_TAG.patch
WORKDIR /gtest
RUN g++ --version \
  && autoreconf -fvi \
  && ./configure \
  && make \
  && make install

RUN git clone --depth=1 -b $GMOCK_BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock \
  && mv /gtest /googlemock/gtest
WORKDIR /googlemock
RUN autoreconf -fvi \
  && ./configure \
  && make \
  && make install \
  && apk del .builddeps
RUN mkdir -p /code
WORKDIR /code
RUN rm -rf /googlemock /tmp/patch
