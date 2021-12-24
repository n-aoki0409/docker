FROM openjdk:8u181-alpine

RUN set -x; \
  apk --update add curl; \
  apk --update add less; \
  apk --update add mysql-client; \
  curl -L https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/0.215/presto-cli-0.215-executable.jar -o /usr/bin/presto; \
  chmod 755 /usr/bin/presto