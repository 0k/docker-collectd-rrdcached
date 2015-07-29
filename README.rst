

Provides a simple ``collectd`` + ``rrdcached`` Dockerfile.

``collectd`` and ``rrdcached`` versions are the one provided by
default on the base image (debian:jessie).

You can provide additional configuration thanks to using volumes in
``/etc/collectd.conf.d/``

And you can save and share your RRD with other nice dockers (wink
``facette``) thanks to volumes in ``/var/lib/rrdcached/db``.
