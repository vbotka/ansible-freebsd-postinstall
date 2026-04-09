.. _qg:

Quick start guide
*****************

For the users who want to try the role quickly this guide provides an example of how to:

* Configure Ansible and install the role

* Create inventory and playbook

Then, on the controller, run the playbook and configure the remote host:

* Set hostname and timezone

* Install packages

* Create users and update authorized SSH keys

* Configure sshd and sudo.


Requirements on the remote host
===============================

* Password-less ssh by *admin* (or any other user by your choice)

* Login shell for *admin* is /bin/sh

* User *admin* is granted unlimited sudo

* Python and Perl are installed.

.. seealso::

   * `Using Ansible on BSD`_
   * `Managing BSD hosts with Ansible`_
   * `Installing Ansible`_


Installation
============

Configure Ansible. Fit the paths to the inventory (3) and to the roles (4) to your needs. Disable
*retry_files* (5). Don't' display *ok* and *skipped* hosts (8-9). Pipelining (13) should speedup the
execution of the playbook.

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> cat ansible.cfg
   [defaults]
   inventory = $PWD/hosts
   roles_path = $HOME/.ansible/roles
   retry_files_enabled = false
   stdout_callback = default
   callback_result_format = yaml
   display_ok_hosts=false
   display_skipped_hosts=false
   log_path = /var/log/ansible.log

   [connection]
   pipelining = true

Install the role ``vbotka.freebsd_postinstall`` ::

   shell> ansible-galaxy role install vbotka.freebsd_postinstall

Install the collections if necessary ::

   shell> ansible-galaxy collection install ansible.posix
   shell> ansible-galaxy collection install ansible.utils
   shell> ansible-galaxy collection install community.general
   shell> ansible-galaxy collection install vbotka.freebsd

Review the role's tasks, handlers, defaults, and vars

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> ls ~/.ansible/roles/vbotka.freebsd_postinstall
   .ansible-lint .ansible-lint.local .configure.tasks .configure.vars .configure.yml
   changelog contrib defaults docs files handlers tasks templates vars
   meta tests .travis.yml LICENSE README.md

Inventory and playbook
======================

Create the inventory ``hosts``

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> cat hosts
   test_14.example.com ansible_host=10.1.0.64

   [example_com]
   test_14.example.com

   [example_com:vars]
   ansible_python_interpreter=/usr/local/bin/python3.8
   ansible_perl_interpreter=/usr/local/bin/perl

Create the playbook ``playbook.yml`` for single *host test_14.example.com*

.. code-block:: bash
   :emphasize-lines: 1
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

Test syntax of the playbook

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml --syntax-check

   playbook: playbook.yml


Set hostname and timezone
=========================

Create ``host_vars`` with customized variables. Enable *hostname* (2) and *timezone* (5). Disable
debug output (7) and backup of changed files (8).

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> cat host_vars/test_14.example.com/fp-common.yml
   fp_hostname: true
   rc_conf_hostname: test_14.example.com
   fp_domain: example.com
   fp_timezone: true
   fp_zoneinfo: UTC
   fp_debug: false
   fp_backup: false

Set ``hostname`` and ``timezone``

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_hostname,fp_timezone

   PLAY [test_14.example.com] *******************************************************************

   TASK [vbotka.freebsd_postinstall : hostname: Configure hostname in /etc/rc.conf] *************
   changed: [test_14.example.com] => (item={'key': 'hostname', 'value': 'test_14.example.com'})

   RUNNING HANDLER [vbotka.freebsd_postinstall : set hostname] **********************************
   changed: [test_14.example.com]

   PLAY RECAP ***********************************************************************************
   test_14.example.com: ok=4 changed=2 unreachable=0 failed=0 skipped=22 rescued=0 ignored=0

UTC is the default timezone. Therefore, no changes were reported.


Install packages
================

Enable the installation of packages (2) and pick the *lists* to be installed (3). See available
*lists* in ``defaults/main/pkgdict_*.yml``

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> cat host_vars/test_14.example.com/fp-packages.yml
   fp_install: true
   fp_packages:
     - {list: minimal, enabled: true}

Install packages

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_packages
     ...


Create users
============

Enable the management of users (2) and create the configuration data (3). Delete default user (7).

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> cat host_vars/test_14.example.com/fp-users.yml
   fp_users: true
   fp_users_conf:
     - {name: admin, shell: /bin/sh, groups: [wheel]}
     - {name: devel, shell: /usr/local/bin/bash, groups: [wheel]}
     - {name: responder, shell: /usr/sbin/nologin}
     - {name: freebsd, state: absent}

Manage users.

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_users

   PLAY [test_14.example.com] *******************************************************************

   TASK [vbotka.freebsd_postinstall : users: Manage user accounts] ******************************
   changed: [test_14.example.com] => (item=admin)
   changed: [test_14.example.com] => (item=devel)
   changed: [test_14.example.com] => (item=responder)

   PLAY RECAP ***********************************************************************************
   test_14.example.com: ok=2 changed=1 unreachable=0 failed=0 skipped=22 rescued=0 ignored=0


Update authorized SSH keys
==========================

Enable the installation of authorized keys (2). Remove other keys if already configured (3). Install
the keys in batches (4). Create the list of the public keys to be installed (5).

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> cat host_vars/test_14.example.com/fp-authorized-key.yml
   fp_authorized_key: true
   fp_authorized_key_install_exclusive: true
   fp_authorized_key_install_individually: false
   fp_authorized_key_conf:
     - user: admin
       key: "{{ lookup('file', '~/.ansible/ssh-pub-keys/devel-srv1/id_rsa.pub') }}"
     - user: admin
       key: "{{ lookup('file', '~/.ansible/ssh-pub-keys/devel-srv2/id_rsa.pub') }}"

Update authorized keys.

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_authorized_key
     ...


Configure sshd
==============

Enable the configuration of *sshd* (2), enable *sshd* service (3), and create the configuration
data (10).

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> cat host_vars/test_14.example.com/fp-sshd.yml 
   fp_sshd: true
   fp_sshd_enable: true
   fp_sshd_passwordauthentication: 'no'
   fp_sshd_challengeresponseauthentication: 'no'
   fp_sshd_permitrootlogin: 'no'
   fp_sshd_permittunnel: 'no'
   fp_sshd_allowtcpforwarding: 'yes'
   fp_sshd_x11forwarding: 'no'
   fp_sshd_conf:
     - {key: PasswordAuthentication, value: "{{ fp_sshd_passwordauthentication }}"}
     - {key: ChallengeResponseAuthentication, value: "{{ fp_sshd_challengeresponseauthentication }}"}
     - {key: PermitRootLogin, value: "{{ fp_sshd_permitrootlogin }}"}
     - {key: PermitTunnel, value: "{{ fp_sshd_permittunnel }}"}
     - {key: AllowTcpForwarding, value: "{{ fp_sshd_allowtcpforwarding }}"}
     - {key: X11Forwarding, value: "{{ fp_sshd_x11forwarding }}"}
     - {key: UseBlacklist, value: 'yes'}

Configure *sshd*.

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_sshd

   PLAY [test_14.example.com] **************************************************************

   TASK [vbotka.freebsd_postinstall : sshd: Configure /etc/ssh/sshd_config] ****************
   changed: [test_14.example.com] => (item={'key': 'PasswordAuthentication', 'value': 'no'})
   changed: [test_14.example.com] => (item={'key': 'ChallengeResponseAuthentication', 'value': 'no'})
   changed: [test_14.example.com] => (item={'key': 'PermitRootLogin', 'value': 'no'})
   changed: [test_14.example.com] => (item={'key': 'PermitTunnel', 'value': 'no'})
   changed: [test_14.example.com] => (item={'key': 'AllowTcpForwarding', 'value': 'yes'})
   changed: [test_14.example.com] => (item={'key': 'X11Forwarding', 'value': 'no'})
   changed: [test_14.example.com] => (item={'key': 'UseBlacklist', 'value': 'yes'})

   RUNNING HANDLER [vbotka.freebsd_postinstall : reload sshd] ******************************
   changed: [test_14.example.com]

   PLAY RECAP ******************************************************************************
   test_14.example.com: ok=4 changed=2 unreachable=0 failed=0 skipped=23 rescued=0 ignored=0


Configure sudo
==============

Enable the configuration of *sudoers* (2) and create the configuration data (3).

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> cat host_vars/test_14.example.com/fp-sudoers.yml
   fp_sudoers: true
   fp_sudoers_conf:
     - {key: admin, value: "ALL=(ALL) NOPASSWD: ALL"}
     - {key: devel, value: "ALL=(ALL) NOPASSWD: ALL"}

Configure *sudoers*.

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_sudoers

   PLAY [test_14.example.com] **************************************************************

   TASK [vbotka.freebsd_postinstall : sudoers: Configure /usr/local/etc/sudoers] ***********
   changed: [test_14.example.com] => (item={'key': 'devel', 'value': 'ALL=(ALL) NOPASSWD: ALL'})

   PLAY RECAP ******************************************************************************
   test_14.example.com: ok=2 changed=1 unreachable=0 failed=0 skipped=22 rescued=0 ignored=0

The user admin has already been enabled. Otherwise the Ansible escalation ``become: true`` wouldn't
work. Therefore, only the user *devel* reported changes.


Complete role
=============

To show the functionality of the role, the tasks in the previous examples (fp_hostname, fp_timezone,
fp_packages, fp_users, fp_authorized_key, fp_sshd, fp_sudoers) were run separately. You can create
the data and run the tasks all in one play.

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> tree .
   .
   ├── ansible.cfg
   ├── playbook.yml
   ├── hosts
   └── host_vars
       └── test_14.example.com
           ├── fp-authorized-key.yml
           ├── fp-common.yml
           ├── fp-packages.yml
           ├── fp-sshd.yml
           ├── fp-sudoers.yml
           └── fp-users.yml
   
   2 directories, 9 files

Run all enabled tasks in the playbook again. Optionally, disable the installation to speedup the
execution.

.. code-block:: bash
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -e fp_install=false

   PLAY [test_14.example.com] ****************************************************************

   PLAY RECAP ********************************************************************************
   test_14.example.com: ok=10 changed=0 unreachable=0 failed=0 skipped=172 rescued=0 ignored=0

.. warning:: The host has not been secured by this playbook and should be used for testing only.


.. _`Using Ansible on BSD`: https://docs.ansible.com/ansible/devel/os_guide/index.html#using-ansible-on-windows-and-bsd
.. _`Managing BSD hosts with Ansible`: https://docs.ansible.com/ansible/devel/user_guide/intro_bsd.html#ansible-and-bsd
.. _`Installing Ansible`: https://docs.ansible.com/ansible/devel/installation_guide/intro_installation.html#installing-ansible
