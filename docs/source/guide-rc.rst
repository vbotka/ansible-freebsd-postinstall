.. _ug_rc:

System configuration
====================

.. seealso:: `Configuration, Services, Logging and Power Management`_

Manage Services
---------------

.. index:: single: rcconf.yml; Manage Services

In most cases, the *tasks-group* :ref:`as_rcconf.yml` is used to configure and manage a service. For
example, to configure *sshd* set the variable ``_service=sshd`` and import ``fn/rcconf.yml`` ::

   - name: "Sshd: Configure rc.conf"
     tags: fp_sshd_rcconf
     vars:
       _service: sshd
     ansible.builtin.import_tasks: fn/rcconf.yml

.. seealso::

   * tasks/:ref:`as_sshd.yml`
   * tasks/fn/:ref:`as_rcconf.yml`

A few variables control the execution flow of these imported tasks.

.. seealso::

   * ``defaults/main/rcconf.yml``
   * ``defaults/main/rcconfd.yml``
   * ``defaults/main/handlers.yml``

fp_rcconfd
^^^^^^^^^^

.. index:: single: fp_rcconfd; Manage Services

Use */etc/rc.conf.d* or */etc/rc.conf*. By default ``fp_rcconfd=false`` */etc/rc.conf* is used.

fp_rcconfd_path
^^^^^^^^^^^^^^^

.. index:: single: fp_rcconfd_path; Manage Services
.. index:: single: fp_rcconfd_file; Manage Services

The dictionary of files used in /etc/rc.conf.d. By default the dictionary is trivial ::

   fp_rcconfd_file:
     apcupsd: apcupsd
     devd: devd
     devfs: devfs
    ...

.. note::

   * The filename in /etc/rc.conf.d/ must be identical to the name of the rc script (service).
   * The configuration in /etc/rc.conf.d/ overrides /etc/rc.conf

.. seealso::
   * `man rc`_
   * `man rc.conf`_
    
he dictionary *fp_rcconfd_file* is used to create the dictionary of paths *fp_rcconfd_path* ::

   fp_rcconfd_path: "{{ dict(fp_rcconfd_file.keys()
                             | zip([fp_rcconfd_dir]
                                   | product(fp_rcconfd_file.values())
                                   | map('join', '/'))) }}"

fp_rcconf_var
^^^^^^^^^^^^^

.. index:: single: fp_rcconf_var; Manage Services

The dictionary of the *fp_<tasks-group>_enable* variables ::

   fp_rcconf_var:
     default: "fp_{{ _service }}_enable"


fp_rcconf_rcvar
^^^^^^^^^^^^^^^

.. index:: single: fp_rcconf_rcvar; Manage Services

The dictionary of the *rcvar* variables ::

   fp_rcconf_rcvar:
     default: "{{ _service }}_enable"
     devfs: devfs_load_rulesets
     qemu: "{{ fp_qemu_rcvar }}"

fp_handlers
^^^^^^^^^^^

.. index:: single: fp_handlers; Manage Services

The lists of handlers for the service *rcvar* values ::
   
   fp_handlers:
     default:
       "YES": ["start {{ _service }}"]
       "NO": ["stop {{ _service }}"]
       "RELOAD": ["reload {{ _service }}"]
     devd:
       "RELOAD": [restart devd]
     devfs:
       "RELOAD": [restart devfs]
     linux:
       "RELOAD": [restart linux]
     ntpdate:
       "RELOAD": [restart ntpdate]
     ntpd:
       "RELOAD": [restart ntpd]


fp_{{ _service }}_rcconf
^^^^^^^^^^^^^^^^^^^^^^^^

List of service configuration. For example, ::

   fp_ntpd_sync_on_start: "YES"
   fp_ntpdate_rcconf:
     - { name: ntpd_sync_on_start, value: "{{ fp_ntpd_sync_on_start }}" }

The default is an empty list.


fp_{{ _service }}_notify
^^^^^^^^^^^^^^^^^^^^^^^^

Boolean. Notify handlers *fp_handlers*. The default is ``true``


fp_{{ _service }}_service_task
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Boolean. Do not wait for the handlers. Start/Stop a service right after the configuration. The
default is ``false``.


.. seealso:: `Managing Services in FreeBSD`_


.. _Configuration, Services, Logging and Power Management: https://docs.freebsd.org/en/books/handbook/config/
.. _Managing Services in FreeBSD: https://docs.freebsd.org/en/books/handbook/config/#configtuning-rcd
.. _man rc: https://man.freebsd.org/cgi/man.cgi?rc(8)
.. _man rc.conf: https://man.freebsd.org/cgi/man.cgi?query=rc.conf
