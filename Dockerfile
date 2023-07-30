FROM ubuntu:22.04

ENV TZ=Etc/UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \
    apt-get -y install python3 \
                       sudo
#RUN rm /usr/bin/python && ln -s /usr/bin/python2 /usr/bin/python
ADD . /build_tools
WORKDIR /build_tools

COPY ./qt-everywhere-src-5.14.2.tar.xz /build_tools/tools/linux/qt_source_5.14.2.tar.xz

CMD cd tools/linux && \
    python3 ./automate.py
