FROM ubuntu:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ENV DEBIAN_FRONTEND=noninteractive
RUN env \
  && apt-get update \
  && apt-get install -q -y git cmake make g++ lcov \
      gettext-base jq curl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG BRANCH_OR_TAG=main
ARG CMAKE_OPTIONS=
RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
COPY patch /tmp/patch
RUN git -C /googletest apply /tmp/patch/$BRANCH_OR_TAG.patch || true
RUN mkdir -p /googletest/build
WORKDIR /googletest/build
RUN cmake .. ${CMAKE_OPTIONS} && make && make install
RUN mkdir -p /code
WORKDIR /code
RUN rm -rf /googletest /tmp/patch
