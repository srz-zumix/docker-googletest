FROM alpine:latest

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

<<<<<<< HEAD
ARG BRANCH_OR_TAG=release-1.8.1
=======
ARG BRANCH_OR_TAG=release-1.10.0
>>>>>>> origin/release-1.10.0
RUN env \
  && apk update && apk upgrade \
  && apk add --no-cache -q -f git cmake make g++ lcov

RUN git clone --depth=1 -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /googletest
RUN mkdir -p /googletest/build
WORKDIR /googletest/build
RUN cmake .. && make && make install
RUN mkdir -p /code
WORKDIR /code
RUN rm -rf /googletest
