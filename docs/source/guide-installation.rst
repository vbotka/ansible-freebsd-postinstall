.. _ug_installation:

Installation
============

The most convenient way how to install an Ansible role is to use
`Ansible Galaxy` CLI ``ansible-galaxy``. The utility comes with the
standard Ansible package and provides the user with a simple interface
to the Ansible Galaxy's services. For example, take a look at the
current status of the role ::

   shell> ansible-galaxy role info vbotka.freebsd_postinstall

and install it ::

   shell> ansible-galaxy role install vbotka.freebsd_postinstall

Install the requirements ::

   shell> ansible-galaxy role install vbotka.ansible_lib

Install the collections if necessary  ::

   shell> ansible-galaxy collection install ansible.posix
   shell> ansible-galaxy collection install ansible.utils
   shell> ansible-galaxy collection install community.general

.. seealso::

   * To install specific versions from various sources see `Installing content`_
   * Take a look at other roles ``shell> ansible-galaxy search --author=vbotka``

.. note::

   This role configures FreeBSD on the remote host. To install and
   configure Ansible on the controller running FreeBSD see:

   * `Using BSD as the control node`_
   * `Installing Ansible`_
   * `Ansible role vbotka.ansible`_

.. _`Installing content`: https://galaxy.ansible.com/docs/using/installing.html
.. _`Using BSD as the control node`: https://docs.ansible.com/ansible/latest/os_guide/intro_bsd.html#using-bsd-as-the-control-node
.. _`Installing Ansible`: https://docs.ansible.com/ansible/devel/installation_guide/intro_installation.html#installing-ansible-on-freebsd
.. _`Ansible role vbotka.ansible`: https://galaxy.ansible.com/vbotka/ansible
