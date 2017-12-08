FROM ubuntu:xenial
LABEL maintainer="Alfie Pates <alfie@alfiepates.me>"

RUN apt-get update \
	&& apt-get install --no-install-recommends -y curl file locales ruby sudo

RUN localedef -i en_GB -f UTF-8 en_GB.UTF-8 \
	&& useradd -m -s /bin/bash borkstrap \
	&& echo 'borkstrap ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers

ADD borkstrap /home/borkstrap/borkstrap

USER borkstrap
WORKDIR /home/borkstrap
ENV USER="borkstrap"
