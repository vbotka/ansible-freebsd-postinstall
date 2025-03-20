============================================
vbotka.freebsd_postinstall 2.7 Release Notes
============================================

.. contents:: Topics


2.7.1
=====

Release Summary
---------------

Major Changes
-------------

Minor Changes
-------------


2.7.0
=====

Release Summary
---------------
* Unified configuration of rc.conf/rc.conf.d
* Optionally, do not notify handler after the rc.conf/rc.conf.d
  configuration. Default fp_*_notify=True
* Optionally, do not wait for a handler and start/stop a service right
  after the rc.conf/rc.conf.d configuration. Default
  fp_*_service_task=False
* Required module vbotka.freebsd.service from the collection vbotka.freebsd
* Update docs.

Major Changes
-------------
* Meta: Ansible 2.18; FreeBSD 13.4, 13.5, 14.1, 14.2
* New tasks/fn/rcconf.yml; enable/disable, configure, and optionally start/stop
  services.
* New vars defaults/main/rcconf.yml
* New vars defaults/main/handlers.yml
* Updated .configure.yml
* Updated .configure.tasks/create_nfs_services.yml; Remove Enable/Disable labels
* Updated .configure.tasks/create_nfsd_services.yml
* New .configure.tasks/create_handlers_service.yml
* New .configure.vars/handlers_service.yml; Create handlers notified from tasks/fn/rcconf.yml
* Updated handlers
* Updated defaults/main
  - variables fp_*_enabled renamed to fp_*_enable
  - new variables fp_*_notify and fp_*_service_task

Minor Changes
-------------
* New dictionary fp_environment default={CRYPTOGRAPHY_OPENSSL_NO_LEGACY: '1'}
* Updated tasks/dhclient.yml
  Optionally read the interfaces from /etc/rc.conf.d/*
  New var fp_dhclient_ifn_rcconfd (default=false)
* community.general.sysrc configures rc.conf/rc.conf.d
  New var fp_rcconfd (default=false) switch /etc/rc.conf to /etc/rc.conf.d
  New dictionary fp_rcconfd_file mapping configuration groups to files in
  /etc/rc.conf.d
  Dictionary fp_rcconfd_path is created in defaults/main/rcconfd.yml
* Replace default() by alias d()
* Update vars/samples
* Update docs
  - Add chapter System configuration.
  - Add annotation/vars/rcconf.yml

Breaking Changes / Porting Guide
--------------------------------
* Attribute key in fp_*_rcconf renamed to name
* Default fp_*_rcconf=[]
* handlers/nfs.yml replaced by handlers/nfsclient.yml
* Variables fp_*_enabled renamed to fp_*_enable
* Variable fp_nfs_service_paths replaced by fp_nfs_services
* Variable fp_nfsd_service_paths replaced by fp_nfsd_services
* Variable fp_ntp_enable replaced by fp_ntpd_enable
