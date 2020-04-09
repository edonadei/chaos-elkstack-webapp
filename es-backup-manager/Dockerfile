FROM ubuntu:bionic
RUN apt-get update && apt-get install curl -y
RUN whoami
USER root

COPY ./bootstrap.sh /bootstrap.sh

ENTRYPOINT ["/bootstrap.sh"]