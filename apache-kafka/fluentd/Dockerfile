FROM fluent/fluentd:edge-debian

# Use root account to use apk  
USER root

# below RUN includes plugin as examples elasticsearch is not required  
# you may customize including plugins as you wish  
RUN buildDeps="sudo make gcc g++ libc-dev" \
  && apt-get update \
  && apt-get install -y --no-install-recommends $buildDeps \
  && apt-get install -y curl \
  && apt-get install -y python \
  && sudo gem install fluent-plugin-route -v 1.0.0 \
  && sudo gem install fluent-plugin-rewrite-tag-filter -v 2.2.0 \
  && sudo gem install fluent-plugin-kafka -v 0.17.4 \
  && sudo gem sources --clear-all \
  && SUDO_FORCE_REMOVE=yes apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY fluent.conf /fluentd/etc/

USER fluent
