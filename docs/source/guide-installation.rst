.. _ug_installation:

Installation
============

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
