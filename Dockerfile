FROM ubuntu:latest
MAINTAINER Origin <webmaster@originos.tk>

# Run Script
WORKDIR /root/
RUN apt update
RUN apt install curl sudo -y
RUN curl https://raw.githubusercontent.com/a1055126159/docker-get-fuchsia-code/master/git.sh > git.sh
RUN bash ./git.sh
