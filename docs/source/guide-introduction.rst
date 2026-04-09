.. _ug_introduction:

Introduction
============

This role is a set of independent groups of tasks(``tasks-group``), imported from separate files,
that configure a particular functionality of the system (cron, hostname, sshd, ...).

* Ansible role: `vbotka.freebsd_postinstall`_
* Supported systems: `FreeBSD`_
* Required collections:

  * `ansible.posix`_
  * `ansible.utils`_
  * `community.general`_
  * `vbotka.freebsd`_

Collection vbotka.freebsd
-------------------------

This role is included in the collection `vbotka.freebsd`_. See the `examples`_. For example,

* `role vbotka.freebsd.postinstall`_
* `syslog-ng server and syslog-ng clients`_
* `iocage host`_

Control flow
------------

.. index:: single: control flow; Introduction

A few variables control the role execution flow. All of them are Boolean, disabled by default.

fp_<tasks-group>
^^^^^^^^^^^^^^^^

.. index:: single: import tasks-group; Introduction

Import ``tasks-group``. The imports of all ``tasks-groups`` are disabled by default. See the control
variables of the form ``fp_<tasks-group>`` in :ref:`as_main.yml`.

fp_<tasks-group>_install
^^^^^^^^^^^^^^^^^^^^^^^^

.. index:: single: install packages; Introduction

Install packages. The control variables ``fp_<tasks-group>_install`` enable the installation of the
predefined groups of packages. See the :ref:`tasks_packages_frameworks` and the files
``defaults/main/pkgdict_*.yml``.

fp_<tasks-group>_enable
^^^^^^^^^^^^^^^^^^^^^^^

.. index:: single: enable service; Introduction

Enable service. The control variables ``fp_<tasks-group>_enable`` enable or disable particular
services. In most cases, the name of the service is used as ``<tasks-group>``. All variables
``fp_<tasks-group>_enable`` are disabled by default. See :ref:`ug_rc`.

fp_<tasks-group>_debug
^^^^^^^^^^^^^^^^^^^^^^

.. index:: single: debug display variables; Introduction

Display debug. Some ``tasks-groups`` provide the debug output which can be turned on by enabling
``fp_<tasks-group>_debug``. All variables ``fp_<tasks-group>_debug`` are disabled by default. See
the section :ref:`ug_debug`.

Tags
----

.. index:: single: tags; Introduction

Limit the ``tasks-groups`` execution by selecting or rejecting(skipping) tags. See :ref:`ug_tags`.

Recommendations
---------------

.. index:: single: recommendations; Introduction

Some tasks are described in detail in the section :ref:`ug_tasks`. If the description of a task is
missing, it's necessary to review the source code to see how to use it. To learn details, it's
always recommended to review the code and notes in the section :ref:`as`. See the section
:ref:`ug_bp` to see how to check syntax, preview potential changes, and debug tasks.

.. hint:: See ``vars/samples``


.. _`vbotka.freebsd`: https://galaxy.ansible.com/ui/repo/published/vbotka/freebsd/
.. _`examples`: https://ansible-collection-freebsd.readthedocs.io/en/latest/ug_examples.html
.. _Role vbotka.freebsd.postinstall: https://ansible-collection-freebsd.readthedocs.io/en/latest/examples/310/example.html
.. _syslog-ng server and syslog-ng clients: https://ansible-collection-freebsd.readthedocs.io/en/latest/examples/500/example.html
.. _iocage host: https://ansible-collection-freebsd.readthedocs.io/en/latest/examples/501/example.html

.. _`vbotka.freebsd_postinstall`: https://galaxy.ansible.com/vbotka/freebsd_postinstall
.. _`FreeBSD`: https://www.freebsd.org/releases
.. _`ansible.posix`: https://galaxy.ansible.com/ui/repo/published/ansible/posix/
.. _`ansible.utils`: https://galaxy.ansible.com/ui/repo/published/ansible/utils/
.. _`community.general`: https://galaxy.ansible.com/ui/repo/published/community/general/
.. _`vbotka.freebsd`: https://galaxy.ansible.com/ui/repo/published/vbotka/freebsd/
