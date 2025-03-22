.. _tasks_packages:

Packages *(packages)*
---------------------

Install and upgrade packages or ports from the packages lists described
below. This way you can create packages lists as needed for a particular purpose
and install them automatically when enabled. The details are described in the
section *Installation frameworks* below. For general management of FreeBSD
packages and ports use Ansible roles `vbotka.freebsd_packages`_ and
`vbotka.freebsd_ports`_

.. seealso::

   * Annotated Source code :ref:`as_packages.yml`
   * Annotated Source code :ref:`as_packages-install.yml`


.. _tasks_packages_defaults:

defaults
^^^^^^^^

See `defaults/main/packages.yml`_. By default, the installation is disabled

.. code-block:: yaml

   fp_install: false

If enabled, the binary packages will be installed. If failed, the
installation will be retried ten times delayed by five seconds

.. code-block:: yaml

   freebsd_install_method: packages
   freebsd_install_retries: 10
   freebsd_install_delay: 5

You can change the defaults to install from ports

.. code-block:: yaml

   freebsd_install_method: ports

and optionally, use the already created binaries

.. code-block:: yaml

   freebsd_use_packages: true

.. seealso::

   * FreeBSD Handbook `Chapter 4. Installing Applications: Packages and Ports`_
   * Ansible module `community.general.pkgng`_
   * Ansible module `community.general.portinstall`_


.. _tasks_packages_lists_pkgorig:

Packages lists pkg-orig
^^^^^^^^^^^^^^^^^^^^^^^

The mandatory structure is a list of dictionaries comprising
attributes *pkglist* and *packages*. The items of the list *packages*
can be of any form accepted by the FreeBSD utilities `pkg`_,
`pkg-upgrade`_ and `portinstall`_. In the below example, the items are
in the form *pkg-orig* aka *category/port*

.. code-block:: yaml

   shell> cat host_vars/foo.example.com/pkg_dict.yml
   ---
   pkg_dict_amd64:
     - pkglist: ansible
       packages:
         - sysutils/ansible
         - sysutils/py-ansible-lint
         - sysutils/py-ansible-runner
     - pkglist: minimal
       packages:
         - shells/bash
         - devel/git@default
         - archivers/gtar
         - ports-mgmt/pkg
         - ports-mgmt/portmaster
         - ports-mgmt/portupgrade
         - net/rsync
         - ftp/wget
     - pkglist: smart
       packages:
         - sysutils/smartmontools
         - sysutils/smart

You can use this form also to:

* build packages by the role `vbotka.freebsd_poudriere`_
* manage packages by the role `vbotka.freebsd_packages`_
* manage ports by the role `vbotka.freebsd_ports`_

.. seealso::

   The default lists of dictionaries *pkg_dict_\** in *defaults/main*. Fit the
   lists to you needs and put them, for example, into the *group_vars/all*

.. note::

   The list of dictionaries is selected automatically by the variable *ansible_architecture* ::

    lookup('vars', 'pkg_dict_' ~ ansible_architecture)

   See :ref:`as_packages-install.yml`


.. _tasks_packages_lists_enable:

Enable lists
^^^^^^^^^^^^

In the variable *fp_packages* enable packages lists that shall be installed

.. code-block:: yaml

   shell> cat host_vars/foo.example.com/fp-packages.yml
   ---
   fp_install: true
   fp_packages:
     - {list: ansible, enabled: true}
     - {list: minimal, enabled: true}


.. _tasks_packages_install:

Install packages
^^^^^^^^^^^^^^^^

.. code-block:: yaml

   shell> ANSIBLE_DISPLAY_SKIPPED_HOSTS=false ansible-playbook pb.yml -t fp_packages
   ...

   TASK [vbotka.freebsd_postinstall : packages: Install packages] ****************************************************************************************
   included: /home/admin/.ansible/roles/vbotka.freebsd_postinstall/tasks/packages-install.yml for foo.example.com => (item=ansible)
   included: /home/admin/.ansible/roles/vbotka.freebsd_postinstall/tasks/packages-install.yml for foo.example.com => (item=minimal)

   TASK [vbotka.freebsd_postinstall : packages-install: Get list of packages for ansible] ****************************************************************
   ok: [foo.example.com]

   TASK [vbotka.freebsd_postinstall : packages-install: Install packages ansible] ************************************************************************
   ok: [foo.example.com] => (item=['sysutils/ansible', 'sysutils/py-ansible-lint', 'sysutils/py-ansible-runner'])

   TASK [vbotka.freebsd_postinstall : packages-install: Get list of packages for minimal] ****************************************************************
   ok: [foo.example.com]

   TASK [vbotka.freebsd_postinstall : packages-install: Install packages minimal] ************************************************************************
   ok: [foo.example.com] => (item=['shells/bash', 'devel/git@default', 'archivers/gtar', 'ports-mgmt/pkg', 'ports-mgmt/portmaster', 'ports-mgmt/portupgrade', 'net/rsync', 'ftp/wget'])

   ...


.. _tasks_packages_upgrade:

Upgrade packages
^^^^^^^^^^^^^^^^

Set *fp_pkg_state=latest* if you want to upgrade packages. The module
`community.general.pkgng`_ by default set the parameter
*use_globs=true*. This means the module, quote: *"Treat the package
names as shell glob patterns"*. Disable this parameter and set
*fp_pkg_use_globs=false* if you use the form *pkg-orig*

.. code-block:: yaml

   shell> ansible-playbook pb.yml -t fp_packages -e fp_pkg_state=latest -e fp_pkg_use_globs=false


.. _tasks_packages_lists_pkgname:

Packages lists pkg-name
^^^^^^^^^^^^^^^^^^^^^^^

You can use the form *pkg-name* to simplify the packages lists. You
might want to create a dictionary first and convert it to the list to
simplify the structure

.. code-block:: yaml

   shell>  cat host_vars/foo.example.com/pkg_dict.yml
   ---
   pkg_dict_amd64: "{{ pkg_dict_amd64_dict |
                       dict2items(key_name='pkglist', value_name='packages') }}"
   pkg_dict_amd64_dict:
     ansible: [py311-ansible, py311-ansible-lint, py311-ansible-runner]
     minimal: [bash, git, gtar, pkg, portmaster, portupgrade, rsync, wget]
     smart: [smartmontools, smart]

You'll have to explicitly include the flavors (py311).

.. seealso :: FreeBSD Handbook `Chapter 7. Flavors`_

.. note ::  The form *pkg-orig* takes the version from the default Python.


.. _tasks_packages_frameworks:

Installation frameworks
^^^^^^^^^^^^^^^^^^^^^^^

You can put the list of enabled package lists into the *host_vars*. For example,

.. code-block:: yaml

   fp_packages:
     - {list: ansible, enabled: true}
     - {list: minimal, enabled: true}
     - {list: postinstall, enabled: true}
     - {list: smart, enabled: true}

Optionally, you can keep the list *fp_packages* together with the
packages lists *pkg_dict_** in *group_vars/all*. In this case, enable
lists that shall be installed always and use variables to selectively
enable other packages lists as needed. For example,

.. code-block:: yaml

   fp_packages:
     - {list: ansible, enabled: true}
     - {list: minimal, enabled: true}
     - {list: postinstall, enabled: true}
     - {list: apcups, enabled: "{{ fp_apcupsd_install }}"}
     - {list: hostap, enabled: "{{ fp_hostapd_install }}"}
     - {list: linux, enabled: "{{ fp_linux_install }}"}
     - {list: procmail, enabled: "{{ fp_procmail_install }}"}
     - {list: smart, enabled: "{{ fp_smartd_install }}"}
     - {list: snmpd, enabled: "{{ fp_snmpd_install }}"}
     - {list: wpa_supplicant, enabled: "{{ fp_wpasupplicant_install }}"}

All tasks are disabled in the role by default. See
:ref:`as_main.yml`. For example, if you want to configure `smartd`_
enable *fp_smartd* to import :ref:`as_smartd.yml`. Enable
*fp_smartd_install* if you also want to install packages list *smart*

.. code-block:: yaml

   fp_apcupsd: true
   fp_apcupsd_install: true
   fp_procmail: true
   fp_procmail_install: true
   fp_smartd: true
   fp_smartd_install: true

.. note ::

   * Some variables of the form *fp_\*_install* are predefined in
     *defaults*. Take a look at the result of the command ::

        shell> egrep -r fp_.*_install ansible-freebsd-postinstall/defaults/

   * Take a look at the values of the variables ::

        shell> ansible-playbook pb.yml -t fp_debug -e fp_debug=true


The simple option is to use the "enablement" variables also in the
list *fp_packages*. For example,

.. code-block:: yaml

   fp_packages:
     - {list: ansible, enabled: true}
     - {list: minimal, enabled: true}
     - {list: postinstall, enabled: true}
     - {list: apcups, enabled: "{{ fp_apcupsd }}"}
     - {list: hostap, enabled: "{{ fp_hostapd }}"}
     - {list: linux, enabled: "{{ fp_linux }}"}
     - {list: procmail, enabled: "{{ fp_procmail }}"}
     - {list: smart, enabled: "{{ fp_smartd }}"}
     - {list: snmpd, enabled: "{{ fp_snmpd }}"}
     - {list: wpa_supplicant, enabled: "{{ fp_wpasupplicant }}"}

In this case, if you enable the tasks the packages list installation
will be also enabled. For example,

.. code-block:: yaml

   fp_apcupsd: true
   fp_procmail: true
   fp_smartd: true

The best practice is to install the packages as a first step

.. code-block:: yaml

   shell> ansible-playbook pb.yml -t fp_packages

Then disable the installation to speedup the play

.. code-block:: yaml

   fp_install: false

Install packages in jail
^^^^^^^^^^^^^^^^^^^^^^^^

.. index:: single: jail; Install packages in jail

The module `community.general.pkgng`_ is `jail-aware`_. The option *jail* says: ::

   Pkg will execute in the given jail name or ID.

For example, given the inventory

.. code-block:: bash

   (env) > ansible-inventory -i iocage-hosts.ini -i hosts --graph
   @all:
     |--@ungrouped:
     |--@iocage:
     |  |--iocage_01
     |  |--iocage_02
     |--@up:
     |  |--afa9e515
     |  |--c1670497
     |  |--test_111

The below configuration file keeps the hosts the jails are running on

.. code-block:: ini

   (env) > cat iocage-hosts.ini
   iocage_01 ansible_host=10.1.0.18
   iocage_02 ansible_host=10.1.0.73

   [iocage]
   iocage_01
   iocage_02

   [iocage:vars]
   ansible_user=admin
   ansible_become=true

The below configuration files provide dynamic inventory comprising the jails

.. code-block:: yaml

   (env) > cat hosts/02_iocage.yml
   plugin: vbotka.freebsd.iocage
   host: 10.1.0.73
   user: admin
   env:
     CRYPTOGRAPHY_OPENSSL_NO_LEGACY: 1
   get_properties: True
   hooks_results:
     - /var/db/dhclient-hook.address.epair0b
   compose:
     ansible_host: (iocage_hooks.0 == '-') | ternary(iocage_ip4, iocage_hooks.0)
     iocage_tags: dict(iocage_properties.notes | split | map('split', '='))

.. code-block:: yaml

   (env) > cat hosts/99_constructed.yml
   plugin: ansible.builtin.constructed
   groups:
       up: iocage_state == 'up'

.. seealso::

   The examples in Ansible `collection vbotka.freebsd`_.

The below playbook installs packages on the running jails. The jails are
identified by the jail ID (JID) stored in the variable *iocage_jid*. A jail is
running on the host *iocage_tags.vmm*

.. code-block:: yaml

   - name: Install packages in jails.
     hosts: up
     gather_facts: true
     remote_user: admin
     become: true

     vars:

       ansible_python_interpreter: auto_silent
       act_pkg:
         - security/sudo
         - lang/python39

     tasks:

       - name: Install packages
         delegate_to: "{{ iocage_tags.vmm }}"
         community.general.pkgng:
           name: "{{ act_pkg }}"
           jail: "{{ iocage_jid }}"
           use_globs: false

The below playbook does the same by importing this role and task ``packages.yml``

.. code-block:: yaml

   - name: Install packages in jails.
     hosts: up
     gather_facts: true
     remote_user: admin
     become: true

     vars:

       ansible_python_interpreter: auto_silent
       fp_packages:
         - {list: custom, enabled: true}
       pkg_dict_amd64:
         - {pkglist: custom, packages: [security/sudo, lang/python39]}

     tasks:

       - name: Install packages
         vars:
           fp_install_delegate: "{{ iocage_tags.vmm }}"
           fp_pkg_jail: "{{ iocage_jid }}"
         ansible.builtin.import_role:
           name: vbotka.freebsd_postinstall
           tasks_from: packages.yml


.. _`vbotka.freebsd_packages`: https://galaxy.ansible.com/ui/standalone/roles/vbotka/freebsd_packages/
.. _`vbotka.freebsd_ports`: https://galaxy.ansible.com/ui/standalone/roles/vbotka/freebsd_ports/
.. _`vbotka.freebsd_poudriere`: https://galaxy.ansible.com/ui/standalone/roles/vbotka/freebsd_poudriere/

.. _`defaults/main/packages.yml`: https://github.com/vbotka/ansible-freebsd-postinstall/tree/master/defaults/main/packages.yml
.. _`Chapter 4. Installing Applications: Packages and Ports`: https://docs.freebsd.org/en/books/handbook/ports/
.. _`Chapter 7. Flavors`: https://docs.freebsd.org/en/books/porters-handbook/flavors/

.. _`community.general.pkgng`: https://docs.ansible.com/ansible/latest/collections/community/general/pkgng_module.html
.. _`community.general.portinstall`: https://docs.ansible.com/ansible/latest/collections/community/general/portinstall_module.html

.. _`pkg`: https://man.freebsd.org/cgi/man.cgi?pkg(8)
.. _`pkg-upgrade`: https://man.freebsd.org/cgi/man.cgi?query=pkg-upgrade
.. _`portinstall`: https://man.freebsd.org/cgi/man.cgi?query=portinstall
.. _`smartd`: https://man.freebsd.org/cgi/man.cgi?smartd(8)

.. _jail-aware: https://wiki.freebsd.org/Jails
.. _collection vbotka.freebsd: https://ansible-collection-freebsd.readthedocs.io/en/stable/ug_examples.html
