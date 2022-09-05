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

Speed/size
----------

*qpress* is significantly faster than many other compression algorithms.
It is however matched in speed/compression by *lz4*.

As an example take this non-scientific dataset with mostly (base64
encoded) attachments::

    1,137,58,9591  mailbox.tar.bz2  <- 15 minutes(!), bzip2
    1,534,049,770  mailbox.tar.lz4  <- 5 seconds, lz4
    1,624,953,644  mailbox.tar.qp   <- 6 seconds, qpress
    1,785,057,280  mailbox.tar      <- original

General recommendation: using *lz4* is better or at least equally good.
