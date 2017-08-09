FROM ubuntu:latest
MAINTAINER Origin <webmaster@originos.tk>

# Run Script
WORKDIR /root/
RUN apt update
RUN apt install curl sudo -y
RUN curl https://raw.githubusercontent.com/a1055126159/docker-get-fuchsia-code/master/get-source-code.sh > get-source-code.sh
RUN bash ./get-source-code.sh
