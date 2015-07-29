FROM debian:jessie
MAINTAINER Valentin Lab <valentin.lab@kalysto.org>

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --force-yes -y --no-install-recommends collectd rrdcached snmp libsnmp30 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD collectd.conf /etc/collectd/collectd.conf
ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

VOLUME /etc/collectd/collectd.conf.d/
VOLUME /var/lib/rrdcached/db

EXPOSE 42217

ENTRYPOINT /entrypoint.sh
