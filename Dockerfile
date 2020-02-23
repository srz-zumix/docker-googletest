FROM ubuntu:trusty

LABEL maintainer "srz_zumix <https://github.com/srz-zumix>"

ARG BRANCH_OR_TAG=release-1.0.1
RUN env && \
  apt-get update && \
  apt-get install -y -q git cmake make g++-4.6 lcov && \
  apt-get install -y -q automake autoconf libtool python && \
  update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 20 && \
  update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.6 20

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googletest.git /gtest
COPY gtest-filepath.patch /gtest/src/
RUN cd /gtest/src && patch -u < gtest-filepath.patch
RUN mkdir -p /gtest/build
WORKDIR /gtest
RUN autoreconf -fvi && \
  ./configure && \
  make && \
  make install

RUN git clone -b $BRANCH_OR_TAG -q https://github.com/google/googlemock.git /googlemock && \
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
