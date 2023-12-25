============================================
vbotka.freebsd_postinstall 2.6 Release Notes
============================================

.. contents:: Topics


2.6.6
=====

Release Summary
---------------
Update to Ansible 2.16. Add FreeBSD 14.0

Major changes
-------------

* Add support to manage /etc/freebsd-update.conf

* Update smartd, apcupsd, devfs, hostapd, nfsd, nfs


2.6.5
=====

Release Summary
---------------
Fix requirements: docs/requirements.txt


2.6.4
=====

Release Summary
---------------
Update fstab. Add changelog. Add docs/requirements.txt

Major changes
-------------
* Formatting and comments in swap.
* Configure fstab swap entries.
* Update fstab sample vars.
* Add ansible_python_version to debug.


2.6.3
=====

Release Summary
---------------
Fix updates

Major changes
-------------
* Added RTD conf file.
* Run groupwrappers before groups.


2.6.2
=====

Release Summary
---------------
Update Ansible 2.14, meta, license

Minor changes
-------------
* Update debug formatting
* Update docs debug
* Update docs themes


2.6.1
=====

Release Summary
---------------
Format debug output, tags, and defaults

Minor changes
-------------
* Format and fix fp_sanity_tags
* Format debug output
* Split vars/main.yml.sample and put samples into the vars/samples
* Update docs


2.6.0
=====

Release Summary
---------------
Add dhclient. Updated docs

Major Changes
-------------

Minor Changes
-------------

Bugfixes
--------

Breaking Changes / Porting Guide
--------------------------------
