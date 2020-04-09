FROM docker.elastic.co/elasticsearch/elasticsearch:7.6.2

RUN echo 'path.repo: ["/opt/elasticsearch/backup"]' >> /usr/share/elasticsearch/config/elasticsearch.yml

COPY docker-entrypoint.sh /

ENTRYPOINT [ "docker-entrypoint.sh" ]