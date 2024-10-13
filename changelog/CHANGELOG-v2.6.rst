============================================
vbotka.freebsd_postinstall 2.6 Release Notes
============================================

.. contents:: Topics


2.6.16
======

Release Summary
---------------
Maintenance including docs update.

Major Changes
-------------

Minor Changes
-------------
* Improve tasks formatting.
* Fix environment: CRYPTOGRAPHY_OPENSSL_NO_LEGACY: '1'
* Update docs.


2.6.15
======

Release Summary
---------------
Maintenance update.

Major Changes
-------------

Minor Changes
-------------
- Update docs.


2.6.14
======

Release Summary
---------------
Maintenance including docs update.

Major Changes
-------------

Minor Changes
-------------
- Update python 3.11 in .travis.yml
- Update playbook .configure.yml


2.6.13
======

Release Summary
---------------
Ansible 2.17 Maintenance including docs update.

Major Changes
-------------
* Update tasks/packages.yml and tasks/packages-install.yml Add
  Pkglist: Assert freebsd_install_method in [packages, ports]
* The playbook .configure.yml generates the files:
  defaults/main/nfsd_services.yml
  defaults/main/nfs_services.yml
* Update defaults/main/nfsd.yml, tasks/nfsd.yml, and handlers/nfsd.yml
* Update defaults/main/nfs.yml, tasks/nfs.yml, and handlers/nfs.yml

Minor Changes
-------------
* Bump role and docs version
* Update docs. Update tasks annotation.
* Update docs/annotation/annotation-tasks.rst.j2


2.6.12
======

Release Summary
---------------
Feature and bugfix release with docs update.

Major Changes
-------------

* Support 14.1
* Update flavor devel/git@default in pkg_dict_amd64
* Update defaults/main/packages.yml
  Update tasks/packages.yml and tasks/packages-install.yml
  Enable upgrade "-t fp_packages -e fp_install=true -e
  fp_pkg_state=latest -e fp_pkg_use_globs=false"

Minor Changes
-------------
* Bump docs version.
* Update debug.yml
* Update hosts sanity testing.
* Update passwords.
* Update tasks mount-*
* Update var pkg_dict_amd64. Add pkg_dict_amd64_dict.
* Add variable fp_role_version
* Add playbook .configure.yml to customize the role. Add file
  defaults/main/sanity_tags.yml. Move default variable fp_sanity_tags
  from defaults/main/sanity.yml to
  defaults/main/sanity_tags.yml. Update tasks/sanity.yml

Bugfixes
--------
* Ansible lint errors and warnings.
* var fp_ntpdate_enable shall be boolean. Was string.

Breaking Changes / Porting Guide
--------------------------------
* Simplified tasks sysctl.yml and loader.yml; Add var
  fp_loader_conf_file_backup_orig
* Rename var fp_sysctl_warning_loader_needed to fp_sysctl_tuneables_warning
* Remove var fp_loader_conf_template_enable
* Add default template loader.conf2.j2
* Add default template freebsd-update.conf2.j2
* var fp_ntpdate_enable changed to boolean. See defaults/main/ntpdate.yml


2.6.11
======

Release Summary
---------------
Feature and docs update.

Major changes
-------------
* Support 13.3 and 14.0

Minor Changes
-------------
* Formatting Travis config.
* Update Ansible lint config.
* Update README
* Exclude docs from local ansible-lint
* Use default rules in local ansible-lint
* Update docs.


2.6.10
======

Release Summary
---------------
Fix test.


2.6.9
=====

Release Summary
---------------
Update defaults/pkgdict_*, freebsd-update, and tests.

Major changes
-------------

Minor Changes
-------------
* Add ports-mgmt/portsnap to defaults/pkgdict_*
* Update freebsd-update. Do not require installation of jc.
* Update tests.


2.6.8
=====

Release Summary
---------------
Update docs requirements readthedocs-sphinx-search==0.3.2


2.6.7
=====

Release Summary
---------------
Feature update and fixes.

Major changes
-------------
* Add tasks vars.yml. Add variables fp_vars(d=false),
  fp_vars_default_versions(d=false), and fp_vars_debug(d:false).
  Get default versions from /usr/ports/Mk/bsd.default-versions.mk
  Creates dictionary pf_default_versions.
* Update defaults/main/pkgdict_versions.yml. Use pf_default_versions
  if avaialable.
* Update defaults/main/pkgdict_*.yml
* Add bsd_gcc_version, bsd_gcc_version_default, and bsd_make_gcc_version
* Add bsd_ssl_version, bsd_ssl_version_default, and bsd_make_ssl_version
* Update tasks/packages.yml and packages-install.yml
* Update vars/samples/make.yml.sample
* Update vars/samples/packages.yml.sample

Minor Changes
-------------
* Update docs
* Update vars debug label.

Bugfixes
--------

Breaking Changes / Porting Guide
--------------------------------
* Update defaults/main/pkgdict_*.yml; Use bsd_gcc_version; Split
  pkglist pip from devel.

2.6.6
=====

Release Summary
---------------
Update to Ansible 2.16. Add FreeBSD 14.0

Major changes
-------------
* Add support to manage /etc/freebsd-update.conf
* Add support to manage inetd, /etc/hosts.allow
* Add support to manage syslogd
* Update smartd, apcupsd, devfs, hostapd, nfsd, nfs, ntpdate, ntp,
  qemu, resolvconf, snmpd, sshd, swap, sysctl, wpasupplicant
* Update procmail. Configure /usr/local/etc/procmailrc
* Add variables bsd_perl_version, bsd_make_perl_version.
  Add vars/samples/make.yml.sample

Minor Changes
-------------
* Update docs

Bugfixes
--------
* #4 Fix apcupsd script location
* #4 Remove double quote when using ntpdate rc vars

Breaking Changes / Porting Guide
--------------------------------
* Update defaults/main/pkgdict_versions.yml


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
