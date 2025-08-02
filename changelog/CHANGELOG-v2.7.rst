============================================
vbotka.freebsd_postinstall 2.7 Release Notes
============================================

.. contents:: Topics


2.7.17
======
Update defaults/main/login.yml

Major Changes
-------------

Minor Changes
-------------
* Add vars:
  fp_login_conf_default
  fp_login_conf_standard
  fp_login_conf_xuser
  fp_login_conf_staff
  fp_login_conf_daemon
  fp_login_conf_news
  fp_login_conf_dialer
  fp_login_conf_root


2.7.16
======
Update tasks authorized-key.yml; Test PK validity.

Release Summary
---------------

Major Changes
-------------

Minor Changes
-------------
* Add var fp_authorized_key_valid_regex
* Add tags fp_authorized_key_sanity and fp_authorized_key_debug
* Update debug.yml


2.7.15
======
Add tasks rcd.yml. Create rc.d scripts.

Release Summary
---------------

Major Changes
-------------

Minor Changes
-------------
* Add defaults/main/rcd.yml
* Add vars/samples/rcd.yml.sample
* Update tasks/main.yml and tasks/debug.yml
* Update docs.


2.7.14
======

Release Summary
---------------
Fix loader.conf. In ansible.posix.sysctl, set reload=false.


2.7.13
======

Release Summary
---------------
Fix loader.conf

Major Changes
-------------

Minor Changes
-------------
* Update docs index.html
* Update loader.conf. Use ansible.posix.sysctl instead of
  community.general.sysrc

Breaking Changes / Porting Guide
--------------------------------
* Variable fp_loader_conf_modules structure changed. See
  vars/samples/loader.yml.sample


2.7.12
======

Release Summary
---------------
Fix loader.conf

Major Changes
-------------

Minor Changes
-------------
* Optionally, if fp_loader_conf_template empty, Configure loader.conf
  by sysrc. Available after community.general #10417 merged.
* Add var fp_loader_conf_modules
* Update template loader.conf2.j2


2.7.11
======

Release Summary
---------------
Maintenance update.

Major Changes
-------------

Minor Changes
-------------
* Update README.
* Add the collection vbotka.freebsd to the test's requirements.


2.7.10
======

Release Summary
---------------
Maintenance update.

Major Changes
-------------

Minor Changes
-------------
* Add /etc/syslog.d configuration. New var fp_syslogd_confd
* Use the role vbotka.freebsd.lib instead of vbotka.ansible_lib
* Update docs.
* Update README.


2.7.9
=====

Release Summary
---------------
Maintenance update.

Major Changes
-------------

Minor Changes
-------------
* Fix Ansible Galaxy lint errors.
* README added chapter Ansible Galaxy Import log lint errors.
* Added template_path to the templates.
* Updated docs annotation templates.


2.7.8
=====

Release Summary
---------------
Maintenance update.

Major Changes
-------------

Minor Changes
-------------
* Support FreeBSD 14.3
* Added tasks/syslog-ng.yml incl. defaults, handlers, templates, and vars.
* Updated tasks/syslogd.yml incl. defaults, templates, and vars.
* Updated docs.
* Updated .configure.yml incl. tasks and vars.


2.7.7
=====

Release Summary
---------------
Maintenance update.

Major Changes
-------------

Minor Changes
-------------
* Updated defaults/main/pkgdict_*.yml

Bug fix
-------
* Fix tasks/packages.yml


2.7.6
=====

Release Summary
---------------
Maintenance update.

Major Changes
-------------

Minor Changes
-------------
* Updated tasks/packages.yml. Added var _fp_pkg_arch
* Updated tasks/qemu.yml. Use default fp_qemu_service=qemu_user_static
* Updated handlers. Added handlers for qemu_user_static
* Updated docs.


2.7.5
=====

Release Summary
---------------
Updated documentation. Updated annotation templates.


2.7.4
=====

Release Summary
---------------
Updated documentation. Updated annotation templates.


2.7.3
=====

Release Summary
---------------
Maintenance update.

Major Changes
-------------
* Updated resolvconf.yml tasks.
  fp_resolvconf_conf_absent item requires 'key' only.

Minor Changes
-------------
* Updated README.md
* Updated devd
  Add dict fp_devd_action_scripts. Create action scripts.
  Add dict fp_devd_misc_files. Create misc files.
  Updated vars devd.yml.sample
* Updated resolvconf.yml tasks and defaults.
  Optionally clean resolvconf.conf and resolv.conf before configuration.
  Add vars fp_resolvconf_conf_clean and fp_resolv_conf_clean (default=false)
  Use module community.general.sysrc to configure resolvconf.conf


2.7.2
=====

Release Summary
---------------
Maintenance and feature update incl. docs update.

Major Changes
-------------

Minor Changes
-------------
* Update docs. Chapter tasks/packages.
* Tasks sanity.yml display nothing by default.
* Add variable fp_sanity_quiet (default=true).
* Add variables: fp_authorized_key_sanity_quiet,
  fp_dhclient_sanity_quiet, fp_hosts_sanity_quiet (default=true).


2.7.1
=====

Release Summary
---------------
Maintenance and feature update incl. docs update.

Major Changes
-------------

Minor Changes
-------------
* Update README.
* Make variable freebsd_use_packages optional.
* Add var fp_install_delegate (default=''). Delegate packages installation if
  not empty.
* Add chapter 'Install packages in jail'.


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
