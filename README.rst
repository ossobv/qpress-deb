qpress-deb :: OSSO build of qpress for Debian/Ubuntu
====================================================

Usage::

    ./Dockerfile.buildmany

Will build Debian/Ubuntu packages of ``qpress`` and
``qlzcat1/qlunzip1/qlzip1`` for a few distributions.

Includes:

* qpress-1.1 as ``qpress``;
* the updated quicklz.h and quicklz.c, version 1.5.1 BETA 7 (October 2011);
* ``qlzip1``, ``qlunzip1``, ``qlzcat1`` that behave like ``gzip``,
  ``gunzip`` and ``zcat``, but use level 1 QuickLZ compression.

Homepage: http://www.quicklz.com/
