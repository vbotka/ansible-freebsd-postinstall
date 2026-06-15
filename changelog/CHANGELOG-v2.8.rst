============================================
vbotka.freebsd_postinstall 2.8 Release Notes
============================================

.. contents:: Topics


2.8.9
=====

Release Summary
---------------
Updated hosts and gitserver.

Major Changes
-------------

Minor Changes
-------------
* Add templates hosts-v2.j2 and hosts-aliases-list-v2.j2
* Add variables fp_hosts_localhost_ipv4_hosts and fp_hosts_localhost_ipv6_hosts
* Update gitserver debug.


2.8.8
=====

Release Summary
---------------
Configuration of git_daemon. Docs updated.

Major Changes
-------------

Minor Changes
-------------
* Update tasks/gitserver.yml; configure service git_daemon
* Docs. Add UG section QA. Add qa-how-rcconf-works.rst

2.8.7
=====

Release Summary
---------------
Add templates/syslog-ng.conf.j2

Major Changes
-------------

Minor Changes
-------------
* Add templates/syslog-ng.conf.j2


2.8.6
=====

Release Summary
---------------
Feature update.

Major Changes
-------------

Minor Changes
-------------
* By default, if fp_sudoers_conf is not empty create the file
  /usr/local/etc/sudoers if missing.
* Add variable fp_sudoers_conf_file_create (default=True).


2.8.5
=====

Release Summary
---------------
Feature update.

Major Changes
-------------

Minor Changes
-------------
* Add template wpa_supplicant.conf-v2.j2


2.8.4
=====

Release Summary
---------------
Upgrade to Ansible 2.20

Major Changes
-------------

Minor Changes
-------------
* Supported versions: 13.5, 14.3, 15.0


2.8.3
=====

Release Summary
---------------
Put ansible facts into the dictionary ansible_facts

Major Changes
-------------

Minor Changes
-------------
* Variable getent_passwd now in the dictionary ansible_facts.getent_passwd
* Put ansible facts into the dictionary ansible_facts
* Add var fp_vars_makefile default=/tmp/Makefile.ansible.default-versions
* Remove parseable option for the configuration ansible-lint.local


2.8.2
=====

Release Summary
---------------
Fix mount-iso and mount-img tasks.

Major Changes
-------------

Minor Changes
-------------
* Remove _fp_mount_debug variable frmon the names.


2.8.1
=====

Release Summary
---------------
Add dictionary fp_ansible_lib; Update mount-\*.yml

Major Changes
-------------

Minor Changes
-------------
* Add dictionary fp_ansible_lib
* In collection import vbotka.freebsd.lib, otherwise import vbotka.ansible_lib
* Remove mount-vnode.yml and put the content into mount-img.yml and mount-iso.yml
* Update docs.


2.8.0
=====

Release Summary
---------------
Ansible 2.19 upgrade.

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
