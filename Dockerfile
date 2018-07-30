FROM ubuntu:16.04

MAINTAINER Dockerfiles

RUN cd /etc/apt/ && cp sources.list sources.list.bak
COPY ./sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
	git \
	python3 \
	python3-dev \
	python3-setuptools \
	python3-pip \
	ibmysqlclient-dev \
	unixodbc-dev \
	nginx \
	supervisor \
	sqlite3 && \
	pip3 install -U pip setuptools && \
   rm -rf /var/lib/apt/lists/*

# install uwsgi now because it takes a little while
RUN pip3 install uwsgi
