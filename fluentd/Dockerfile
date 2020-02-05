FROM fluent/fluentd:v1.9-1

# Use root account to use apk  
USER root

# below RUN includes plugin as examples elasticsearch is not required  
# you may customize including plugins as you wish  
RUN apk add --no-cache --update --virtual .build-deps \  
  sudo build-base ruby-dev \
  && sudo gem install fluent-plugin-route -v 1.0.0 \
  && sudo gem install fluent-plugin-rewrite-tag-filter -v 2.2.0 \
  && sudo gem install fluent-plugin-prometheus -v 1.7.0 \
  && sudo gem sources --clear-all \  
  && apk del .build-deps \  
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY fluent.conf /fluentd/etc/

USER fluent
