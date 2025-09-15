============================================
vbotka.freebsd_postinstall 2.8 Release Notes
============================================

.. contents:: Topics


2.8.0
=====

Release Summary
---------------

Major Changes
-------------
* Meta: Ansible 2.19; FreeBSD 13.5, 14.2, and 14.3

Minor Changes
-------------
* Explicit bool conversion is no longer needed.

Bug fix
-------
* Add missing default fp_qemu_user_static_enable=false
* Add missing default fp_swap_file=/usr/swap0
* Add missing variable _service=tmpmfs in tasks/tmpmfs.yml

Breaking Changes / Porting Guide
--------------------------------
