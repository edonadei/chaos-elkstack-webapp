FROM docker.elastic.co/beats/filebeat:7.6.2

USER root
VOLUME /containers/
RUN chown -Rf filebeat /containers/
RUN chmod -Rf 777 /containers/
