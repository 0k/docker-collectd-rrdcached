#!/bin/sh

mkdir -p /var/lib/rrdcached/journal
/usr/bin/rrdcached -l unix:/var/run/rrdcached/rrdcached.sock -j /var/lib/rrdcached/journal/ -F -b /var/lib/rrdcached/db/ -B -l 0.0.0.0 -p /var/run/rrdcached.pid -g &
/usr/sbin/collectd -f "$@"

