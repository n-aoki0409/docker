# Elasticsearch 7.5.2

FROM docker.elastic.co/elasticsearch/elasticsearch:7.5.2
USER root

ADD config/elasticsearch.yml /usr/share/elasticsearch/config/
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml

RUN cd /usr/share/elasticsearch && bin/elasticsearch-plugin install analysis-kuromoji

USER elasticsearch