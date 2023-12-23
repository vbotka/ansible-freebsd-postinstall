.. _ug_debug:

Debug
=====

To display some facts (11-17) and values of the control variables, run select the task *fp_debug*
and enable the debug output. By default all control variables are disabled.

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
