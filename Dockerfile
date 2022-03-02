FROM ubuntu:20.04
ARG srcrepo="https://git.code.sf.net/p/fsp/code"
ARG srctag="2.8.1b29"
RUN mkdir /tmp/build
WORKDIR /tmp/build
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    scons \
    bison \
    flex \
 && rm -rf /var/lib/apt/lists/*
RUN git clone --depth 1 --branch $srctag $srcrepo .
RUN scons
RUN scons install
ENTRYPOINT [ "/usr/local/bin/fspd" ] 