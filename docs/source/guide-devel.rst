Development and testing
=======================

In order to deliver an Ansible project, it's necessary to test the code and configuration. The tags
provide the administrators with a tool to test groups of tasks. For example, to test a group of
tasks at single remote host *test_01*, create the playbook.

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
valid tag or with a comma-separated list of tags.

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t <tag> --check --diff

When all seems to be ready, run the command. Run the command twice and make sure the playbook and
the configuration is :index:`idempotent`.

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t <tag>
