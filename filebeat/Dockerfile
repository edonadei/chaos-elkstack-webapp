FROM centos:7

RUN yum update -y && yum install -y curl && yum clean all

RUN curl -Lso - https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.2-linux-x86_64.tar.gz | \
      tar zxf - -C /tmp && \
    mv /tmp/filebeat-7.6.2-linux-x86_64 /usr/share/


ENV ELASTIC_CONTAINER true
ENV PATH=/usr/share/:$PATH

COPY config /usr/share/

# Add entrypoint wrapper script
ADD docker-entrypoint /usr/local/bin

WORKDIR /usr/share/
RUN mkdir data logs && \
    chown -R root:filebeat . && \
    find /usr/share/ -type d -exec chmod 0750 {} \; && \
    find  /usr/share/ -type f -exec chmod 0640 {} \; && \
    chmod 0750 /usr/share/filebeat && \
    chmod 0770 modules.d && \
    chmod 0770 data logs

USER root

LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.vendor="Elastic" \
  org.label-schema.name="filebeat" \
  org.label-schema.version="7.6.2" \
  org.label-schema.url="https://www.elastic.co/products/beats/filebeat" \
  org.label-schema.vcs-url="https://github.com/elastic/beats-docker" \
  license="Elastic License"

CMD ["-e"]