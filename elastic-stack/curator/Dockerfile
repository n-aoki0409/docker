FROM alpine:3.8

RUN apk --update add --no-cache tini python py-pip \
  && pip install --upgrade pip \
  && pip install elasticsearch-curator==5.8.1

COPY entrypoint.sh /

ENTRYPOINT ["sh", "/entrypoint.sh"]
