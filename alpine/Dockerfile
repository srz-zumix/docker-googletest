FROM alpine:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

RUN env \
  && apk update && apk upgrade \
  && apk add --no-cache -q -f git cmake make g++ lcov gettext-base jq curl

ARG BRANCH_OR_TAG=main
ARG CMAKE_OPTIONS=
RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build
COPY patch /tmp/patch
RUN git -C /googletest apply /tmp/patch/$BRANCH_OR_TAG.patch || true
WORKDIR /googletest/build
RUN cmake .. ${CMAKE_OPTIONS} && make && make install
RUN mkdir -p /code
WORKDIR /code
RUN rm -rf /googletest /tmp/patch
