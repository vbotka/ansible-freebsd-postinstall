============================================
vbotka.freebsd_postinstall 2.7 Release Notes
============================================

.. contents:: Topics


2.7.0
=====

Release Summary
---------------

Major Changes
-------------
* Meta: Ansible 2.18; FreeBSD 13.4, 14.1, 14.2

Minor Changes
-------------
* Update tasks/dhclient.yml
  Optionally read the interfaces from /etc/rc.conf.d/*
  Add var fp_dhclient_ifn_rcconfd (default=false)
* Use community.general.sysrc to configure rc.conf
  Add var fp_rcconfd (default=false) switch /etc/rc.conf to /etc/rc.conf.d
  Add dictionary fp_rcconfd_file mapping configuration groups to files in
  /etc/rc.conf.d
  Create dictionary fp_rcconfd_path in defaults/main/rcconfd.yml

Breaking Changes / Porting Guide
--------------------------------
