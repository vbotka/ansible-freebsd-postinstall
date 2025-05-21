.. _ug_debug:

Debug
=====

To display some facts (12-18) and values of the control variables
(36-80), select the task *fp_debug* and enable the debug output. By
default, all control variables are disabled. Below is an example
configuration of a typical VM for testing

.. include:: debug-example.rst

.. note:: If you use the configuration from the Quick start guide enable *ok* hosts either by the
          environment variable ``ANSIBLE_DISPLAY_OK_HOSTS=True`` or in the configuration file
          ``display_ok_hosts=true``.

Some tasks will display additional information when the variable
:index:`fp_*_debug` is enabled.  For example, see the configuration of
sshd below. Inspect the files in the ``tasks`` directory whether
*debug* is available or not

.. include:: debug-sshd-example.rst

.. hint::

   The debug output of this role is optimized for ``result_format=yaml``. See
   `result_format`_. Set it in the configuration

   .. code:: ini

      [defaults]
      callback_result_format = yaml

   , or in the environment

   .. code:: bash

      ANSIBLE_CALLBACK_RESULT_FORMAT=yaml


.. seealso::

   * `Playbook Debugger <https://docs.ansible.com/ansible/latest/user_guide/playbooks_debugger.html>`_
   * `Debugging modules <https://docs.ansible.com/ansible/latest/dev_guide/debugging.html#debugging-modules>`_
   * `Python Debugging With Pdb <https://docs.python.org/3/library/pdb.html>`_

.. _Playbook Debugger: https://docs.ansible.com/ansible/latest/user_guide/playbooks_debugger.html
.. _Debugging modules: https://docs.ansible.com/ansible/latest/dev_guide/debugging.html#debugging-modules
.. _Python Debugging With Pdb: https://docs.python.org/3/library/pdb.html
.. _result_format: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/default_callback.html#parameter-result_format
