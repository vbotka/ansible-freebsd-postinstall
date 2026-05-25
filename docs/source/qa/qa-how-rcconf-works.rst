.. _qa_how_rcconf_works:

How tasks/fn/rcconf.yml works
-----------------------------

(generated)

.. index:: single: rcconf.yml; QA How tasks/fn/rcconf.yml works

The file ``tasks/fn/rcconf.yml`` (and similarly structured files inside automated sub-task
directories, often designated as functional helpers or fn/) serves as a reusable, streamlined
utility task file. Its main objective is to abstract, validate, and write system configurations to
``/etc/rc.conf`` using FreeBSD's native system configuration tool mechanism.

This functional task file operates using the following logical structure and mechanics:

The Core Engine: community.general.sysrc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Instead of using generic file manipulation modules like ``lineinfile`` or ``templates`` which can be
brittle and prone to syntax errors in shell scripts, ``fn/rcconf.yml`` relies heavily on the
``community.general.sysrc`` module.

This module acts as a wrapper around FreeBSD's native ``sysrc(8)`` utility.

It ensures safe editing, proper quoting, and system-level syntax validation for ``/etc/rc.conf``.

Variable Decoupling and Flattening
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The file is structured to be executed inside a loop or through an ``ansible.builtin.include_tasks``
statement. It expects a high-level configuration dictionary (often defined in your role variables or
``defaults/main.yml``) containing key-value configurations.

When invoked, it typically maps variables similar to this structure:

.. code-block:: yaml

     # How it maps incoming data dynamically
   - name: "Rcconf: Configure rc.conf variables"
     community.general.sysrc:
       name: "{{ item.name }}"
       value: "{{ item.value }}"
       dest: "{{ item.dest | default('/etc/rc.conf') }}"
     loop: "{{ fp_rcconf_list }}"
     # Variable names shift depending on the specific parent task (e.g., fp_apcupsd_rcconf, etc.)

Conditional Triggers and Idempotency
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Because modifying ``/etc/rc.conf`` usually requires a service reload or restart to take effect,
``fn/rcconf.yml`` handles change-tracking smoothly:

Handlers and Notifications
^^^^^^^^^^^^^^^^^^^^^^^^^^

If the ``sysrc`` module registers a change (i.e., a configuration was added or modified), it triggers a
conditional notify to the role's global service handlers (e.g., restart iocage, reload pf, or
general networking handlers).

State Management
^^^^^^^^^^^^^^^^

It can handle service states dynamically. For example, if an incoming list contains ``state:
absent``, it uses ``sysrc`` with ``state: absent`` to clean up old or conflicting service
configurations from ``/etc/rc.conf``.

Integration with Sanity Checks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Before ``fn/rcconf.yml`` applies changes, parent playbooks or wrapping blocks often perform a sanity
check (e.g., ensuring mutually exclusive service actions like start and stop aren't enabled
simultaneously). If the sanity check passes, ``fn/rcconf.yml`` is safely called to ensure that your
system-level services are configured to boot correctly upon the next system startup.
