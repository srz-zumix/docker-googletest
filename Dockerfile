FROM ubuntu:trusty

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=release-1.2.1
ARG GMOCK_BRANCH_OR_TAG=release-1.0.0
RUN env
RUN apt-get update && \
  apt-get install -y -q git cmake make g++-4.6 lcov && \
  apt-get install -y -q automake autoconf libtool python
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 20 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 20

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
RUN mkdir -p /gtest/build
WORKDIR /gtest
RUN autoreconf -fvi && \
  ./configure && \
  make && \
  make install

RUN git clone -b $GMOCK_BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock && \
  mv /gtest /googlemock/gtest
WORKDIR /googlemock
RUN autoreconf -fvi \
  && ./configure \
  && make \
  && make install \
  && bash -c 'echo /usr/local/lib >> /etc/ld.so.conf.d/usr_local_path.conf' \
  && ldconfig
RUN mkdir -p /code
WORKDIR /code
RUN rm -rf /googlemock
