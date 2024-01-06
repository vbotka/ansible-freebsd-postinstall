.. _ug_introduction:

Introduction
============

The role is a set of independent sets of tasks, grouped in separate files, that configure a particular functionality of the system (cron, hostname, sshd, ...). By default, all tasks are
disabled. See the control variables of the form ``fp_<tasks_group>`` in ``tasks/main.yml``. There
are two more categories of control variables used by some of the tasks. ``fp_<tasks_group>_install``
and ``fp_<task_group>_enable``. The first one can be used to selectively install predefined groups
of packages needed by the tasks. See ``tasks/packages.yml`` and ``defaults/main/pkgdict_*.yml``. The
control variables ``fp_<tasks_group>_enable`` can be used to enable or disable the particular
services. Configure and enable the tasks and services that you need. In addition to this, some
groups of tasks start with the debug output which can be turned on by enabling
``fp_<tasks_group>_debug``. See the ``Debug`` section below. To speedup the execution of a playbook
it's possible to select particular groups of tasks only. See the ``Tags`` section on how to use
them. Some tasks are described in detail in the section ``Tasks``. If the description of a task is
missing it's necessary to review the source code on how to use it. To learn details, it's always
recommended to review the code and notes in the section ``Annotated source code``.  See the section
``Best practice`` on how to check syntax, preview potential changes, and debug tasks.

* Ansible role: `freebsd_postinstall <https://galaxy.ansible.com/vbotka/freebsd_postinstall/>`_
* Supported systems: `FreeBSD <https://www.freebsd.org/releases/>`_
* Requirements: `ansible_lib <https://galaxy.ansible.com/vbotka/ansible_lib>`_
