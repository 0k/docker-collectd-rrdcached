FROM debian:jessie
MAINTAINER Valentin Lab <valentin.lab@kalysto.org>

ENV BASEDIR /var/lib/rrdcached/db

ENV LOGSTASH_SERVER logstash
ENV LOGSTASH_PORT 25826

RUN apt-get update && \
    apt-get install --force-yes -y --no-install-recommends collectd rrdcached && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD collectd.conf /etc/collectd/collectd.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

VOLUME /etc/collectd/collectd.conf.d/
VOLUME ${BASEDIR}

ENTRYPOINT /entrypoint.sh
