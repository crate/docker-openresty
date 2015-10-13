====================
OpenResty Dockerfile
====================

Base Docker Image
=================

`ubuntu:latest`_

Current Version
===============

Openresty_ ``1.9.3.1``

Installation
============

1. Install Docker_
2. Download latest build from `Docker Hub Registry`_::

  docker pull crate/openresty:latest

Alternatively you can build an image from ``Dockerfile``::

  export VERSION=1.9.3.1
  docker build --rm --force-rm --tag crate/openresty:${VERSION} .

Run Openresty
=============

::

  docker run \
    -p 80:80 \
    -p 443:443 \
    -v /path/to/conf.d/:/conf \
    -v /path/to/data:/data \
    -v /path/to/logs:/logs \
    crate/openresty:1.9.3.1
      /usr/local/openresty/nginx/sbin/nginx -p /data -c /conf/nginx.conf

Volumes
-------

There are 3 volumes to mount: ``/conf``, ``/data``, and ``/logs``.

* The ``/conf`` volume should contain your NGINX configuration files (``nginx.conf``).
* The ``/data`` volume should contain your static files that you want to serve.
* The ``/logs`` volume should point to the logs directory of the host  (e.g. ``/var/logs``).


Configuration
--------------

If you want to include package files such as ``mime.type`` or ``fastcgi_params``,
you can find them located in ``/usr/local/openresty/nginx/conf/``.

You can include them in your ``nginx.conf`` like::

  http {
    include       /usr/local/openresty/nginx/conf/mime.types;
    default_type  application/octet-stream;
    ...
  }


.. _Docker: https://docker.com
.. _Docker Hub Registry: https://registry.hub.docker.com
.. _Openresty: http://openresty.org/
.. _`ubuntu:latest`: https://hub.docker.com/_/ubuntu/

