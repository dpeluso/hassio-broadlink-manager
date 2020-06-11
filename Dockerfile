FROM ubuntu:18.04

LABEL maintainer="tomer.klein@gmail.com"

ENV PYTHONIOENCODING=utf-8

#install pip3
RUN apt update

RUN apt install python3-pip --yes

RUN  pip3 install flask flask_restful cryptography==2.6.1 broadlink --no-cache-dir

#Create working directory
RUN mkdir /opt/broadlinkmanager

EXPOSE 7020

COPY broadlinkmanager /opt/broadlinkmanager

ENTRYPOINT ["/usr/bin/python3", "/opt/broadlinkmanager/broadlinkmanager.py"]
