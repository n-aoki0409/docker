FROM openjdk:8u181-alpine

RUN set -x; \
  apk --update add curl; \
  apk --update add python; \
  apk --update add less; \
  curl -L https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.215/presto-server-0.215.tar.gz | tar zx -C /usr/local; \
  mkdir /usr/local/presto-server-0.215/etc; \
  mkdir /usr/local/presto-server-0.215/etc/catalog; \
  mkdir /var/presto;
ADD etc/ /usr/local/presto-server-0.215/etc/
ADD etc/catalog/ /usr/local/presto-server-0.215/etc/catalog/
CMD ["/usr/local/presto-server-0.215/bin/launcher", "run"]