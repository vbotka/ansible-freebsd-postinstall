.. _ug_introduction:

Introduction
============

The role is a set of independent sets of tasks, grouped in separate
files, that configure a particular functionality of the system (cron,
hostname, sshd, ...).

* Ansible role: `vbotka.freebsd_postinstall`_
* Supported systems: `FreeBSD`_
* Required:

  * role `vbotka.ansible_lib`_
  * collection `ansible.posix`_
  * collection `ansible.utils`_
  * collection `community.general`_

Enable tasks
------------

All tasks are disabled by default. See the control variables of the
form ``fp_<tasks_group>`` in :ref:`as_main.yml`. There are two more
categories of control variables used by some of the
tasks. ``fp_<tasks_group>_install`` and ``fp_<task_group>_enable``.

Install packages
----------------

The control variables ``fp_<tasks_group>_install`` can be used to
install predefined groups of packages needed by the tasks. See
:ref:`tasks_packages_frameworks` and ``defaults/main/pkgdict_*.yml``.

Enable services
---------------

The control variables ``fp_<tasks_group>_enable`` can be used to
enable or disable the particular services. Configure and enable the
tasks and services that you need.

Display debug
-------------

In addition to this, some groups of tasks start with the debug output
which can be turned on by enabling ``fp_<tasks_group>_debug``. See the
section :ref:`ug_debug`.

Recommendations
---------------

To speedup the execution of a playbook it's possible to select
particular groups of tasks only. See the ``Tags`` section how to use
them. Some tasks are described in detail in the section ``Tasks``. If
the description of a task is missing it's necessary to review the
source code on how to use it. To learn details, it's always
recommended to review the code and notes in the section ``Annotated
source code``.  See the section ``Best practice`` on how to check
syntax, preview potential changes, and debug tasks.

.. _`vbotka.freebsd_postinstall`: https://galaxy.ansible.com/vbotka/freebsd_postinstall
.. _`vbotka.ansible_lib`: https://galaxy.ansible.com/vbotka/ansible_lib
.. _`FreeBSD`: https://www.freebsd.org/releases
.. _`ansible.posix`: https://galaxy.ansible.com/ui/repo/published/ansible/posix/
.. _`ansible.utils`: https://galaxy.ansible.com/ui/repo/published/ansible/utils/
.. _`community.general`: https://galaxy.ansible.com/ui/repo/published/community/general/
