.. _ug_tags:

Tags
====

The :index:`tags` provide the user with a powerful tool to run selected groups of tasks. Use the
command below to display available tags

.. include:: tags-list.rst

For example,

* enable debug and display the list of the control variables and their values

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t fp_debug -e fp_debug=true

* See what packages will be installed

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t fp_packages -e fp_install=true --check

* Install the packages

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t fp_packages -e fp_install=true

Validity
--------

The role is testing validity of the tags. The tests are enabled by default

.. code-block:: yaml

   fp_sanity: true
   fp_sanity_tags_fatal: true

The role will fail if you use unknown tag. For example,

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t unknown_tag
   ...
   TASK [vbotka.freebsd_postinstall : Sanity: Unknown run tags] ************************************
   fatal: [test_14.example.com]: FAILED! => changed=false
   msg: '[ERR] Unknown run tag(s): [''unknown_tag'']'
