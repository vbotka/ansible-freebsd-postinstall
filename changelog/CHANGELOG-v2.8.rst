============================================
vbotka.freebsd_postinstall 2.8 Release Notes
============================================

.. contents:: Topics


2.8.3
=====

Release Summary
---------------
Fix missing handlers.

Major Changes
-------------

Minor Changes
-------------
* Add var fp_vars_makefile default=/tmp/Makefile.ansible.default-versions
* Remove parseable option for the configuration ansible-lint.local
* Variable getent_passwd now in the dictionary ansible_facts.getent_passwd


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
