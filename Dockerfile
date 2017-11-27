FROM alpine:3.6

LABEL maintainer="Juliano Petronetto <juliano@petronetto.com.br>"
LABEL name="Python 3 Builder" \
      description="Python 3 Alpine container for build purposes" \
      url="http://petronetto.com.br" \
      hub-url="https://hub.docker.com/r/petronetto/py3-builder" \
      vcs-url="https://github.com/petronetto/py3-builder" \
      vendor="Petronetto DevTech" \
      version="1.0" \
      schema-version="1.0"

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/main | tee /etc/apk/repositories \
    && echo http://dl-cdn.alpinelinux.org/alpine/edge/testing | tee -a /etc/apk/repositories \
    && echo http://dl-cdn.alpinelinux.org/alpine/edge/community | tee -a /etc/apk/repositories \
    && apk add -U --no-cache tini bash \
        curl ca-certificates python3 libgomp \
        freetype jpeg libpng libstdc++ \
## Setup de basic requeriments
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 --no-cache-dir install --upgrade pip setuptools \
    && if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip; fi \
    && if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi \
    && ln -s locale.h /usr/include/xlocale.h \
## Build dependencies
    && apk add -U --no-cache --virtual=.build-dependencies \
        build-base linux-headers python3-dev git cmake jpeg-dev \
        libffi-dev openblas-dev py-numpy-dev freetype-dev libpng-dev

ENTRYPOINT ["/sbin/tini", "--"]
