.. _ug:

############
User's guide
############
.. contents:: Table of Contents
   :depth: 4


.. _ug_introduction:

************
Introduction
************

The role is a collection of independent sets of tasks, grouped in separate files, that configure
particular functionality of the system (cron, hostname, sshd, ...). By default all tasks are
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


.. _ug_installation:

************
Installation
************

The most convenient way how to install an Ansible role is to use :index:`Ansible Galaxy` CLI
``ansible-galaxy``. The utility comes with the standard Ansible package and provides the user with a
simple interface to the Ansible Galaxy's services. For example, take a look at the current status of
the role

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-galaxy info vbotka.freebsd_postinstall

and install it

.. code-block:: console
   :emphasize-lines: 1

    shell> ansible-galaxy install vbotka.freebsd_postinstall

Install the requirements

.. code-block:: console
   :emphasize-lines: 1

    shell> ansible-galaxy install vbotka.ansible_lib

.. seealso::
   * To install specific versions from various sources see `Installing content <https://galaxy.ansible.com/docs/using/installing.html>`_
   * Take a look at other roles ``shell> ansible-galaxy search --author=vbotka``


.. _ug_playbook:

********
Playbook
********

Create simple playbook that calls this role (10) at a single host test_14.example.com (2)

.. code-block:: sh
   :emphasize-lines: 2,10
   :linenos:

   shell> cat playbook.yml
   - hosts: test_14.example.com
     gather_facts: true
     connection: ssh
     remote_user: admin
     become: true
     become_user: root
     become_method: sudo
     roles:
       - vbotka.freebsd_postinstall

.. note:: Enable ``gather_facts: true`` (3) to collect facts.

.. seealso::
   * For details see `Connection Plugins <https://docs.ansible.com/ansible/latest/plugins/connection.html>`_ (4-5)
   * See also `Understanding Privilege Escalation <https://docs.ansible.com/ansible/latest/user_guide/become.html#understanding-privilege-escalation>`_ (6-8)


.. _ug_tags:

****
Tags
****

The :index:`tags` provide the user with a very useful tool to run selected groups of tasks. To see
what tags are available list the tags of the role with the command

.. include:: tags-list.rst

For example,

* enable debug and display the list of the control variables and their values

.. code-block:: console
   :emphasize-lines: 1

    shell> ansible-playbook playbook.yml -t fp_debug -e fp_debug=true

* See what packages will be installed

.. code-block:: console
   :emphasize-lines: 1

    shell> ansible-playbook playbook.yml -t fp_packages --check

* Install the packages only

.. code-block:: console
   :emphasize-lines: 1

    shell> ansible-playbook playbook.yml -t fp_packages


.. _ug_debug:

*****
Debug
*****

To display some facts (11-16) and values of the control variables, run select the task *fp_debug*
and enable the debug output. By default all control variables are disabled. The example below shows
values used in the examples of the Quick start guide

.. include:: debug-example.rst

.. note:: If you use the configuration from the Quick start guide enable *ok* hosts either by the
          environment variable ``ANSIBLE_DISPLAY_OK_HOSTS=True`` or in the configuration file
          ``display_ok_hosts=true``.

Some tasks will display additional information when the variable :index:`fp_*_debug` is enabled,
e.g. configuration of sshd below. Inspect the files in the ``tasks`` directory whether *debug* is
available or not

.. include:: debug-sshd-example.rst

.. note::

   * The debug output of this role is optimized for the *default* or *yaml* callback plugin. Set the
     plugin in the environment, e.g. ``shell> export ANSIBLE_STDOUT_CALLBACK=default`` or in the
     configuration file ``stdout_callback = default``.

   * See the details about the yaml callback plugin ``shell> ansible-doc -t callback yaml``

   * See the list of other callback plugins ``shell> ansible-doc -t callback -l``


.. seealso::
   * `Playbook Debugger <https://docs.ansible.com/ansible/latest/user_guide/playbooks_debugger.html>`_
   * `Debugging modules <https://docs.ansible.com/ansible/latest/dev_guide/debugging.html#debugging-modules>`_
   * `Python Debugging With Pdb <https://realpython.com/python-debugging-pdb/>`_


.. _ug_sanity:

******
Sanity
******

By default the checking of sanity is turned on ::

  fp_sanity: true
  fp_sanity_tags_fatal: true

<TODO>


.. _ug_tasks:

*****
Tasks
*****

The description of the tasks is not complete. The `role <https://galaxy.ansible.com/vbotka/freebsd_postinstall/>`_ and the documentation is work in progress. Feel free to `share your feedback and report issues <https://github.com/vbotka/ansible-freebsd-postinstall/issues>`_.

`Contributions are welcome <https://github.com/firstcontributions/first-contributions>`_.

.. seealso::
   * Source code :ref:`as_main.yml`


Development and testing
=======================

In order to deliver an Ansible project it's necessary to test the code and configuration. The tags
provide the administrators with a tool to test groups of tasks. For example, to test a group of
tasks at single remote host *test_01*, create the playbook

.. code-block:: sh
   :emphasize-lines: 1

   shell> cat playbook.yml
   - hosts: test_01
     roles:
       - vbotka.freebsd_postinstall

Customize configuration in ``host_vars/test_01/fp-*.yml`` and :index:`check the syntax`

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml --syntax-check

Then :index:`dry-run` the selected group of tasks and see what will be changed. Replace <tag> with
valid tag or with a comma-separated list of tags

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t <tag> --check --diff

When all seems to be ready run the command. Run the command twice and make sure the playbook and the
configuration is :index:`idempotent`

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t <tag>
   

.. _ug_task_task1:
.. include:: task-task1.rst

Examples
--------
.. toctree::
   :name: task1_toc

   task-task1-ex1
   task-task1-ex2


.. _ug_vars:

*********
Variables
*********

.. seealso::
   * `Ansible variable precedence: Where should I put a variable?
     <https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable>`_

.. _ug_vars_defaults:
.. include:: vars-defaults.rst


.. _ug_bp:

*************
Best practice
*************

Test syntax

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml --syntax-check

See what variables will be included

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t fp_debug -e fp_debug=true

:index:`Dry-run`, display differences and display variables

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -e fp_debug=true --check --diff


Install packages. Run this task separately if the installation takes too long. Then disable it.

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t fp_packages -e fp_install=true

Run the playbook

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -e fp_install=false

Test the :index:`idempotency`. The role and the configuration data shall be idempotent. There
should be no changes reported by *ansible-playbook* when the playbook is run repeatedly. Disable the
debug output, and the installation of packages or ports to speedup the playbook.

.. code-block:: console
   :emphasize-lines: 1

    shell> ansible-playbook playbook.yml


.. _ug_bp_firstboot:

Recommended configuration after the installation of OS
======================================================

Configure hostname, users, sudoers, network and reboot

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t fp_hostname, ...
   <TODO>
