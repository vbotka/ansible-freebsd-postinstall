.. _ug_tags:

Tags
====

The :index:`tags` provide the user with a very useful tool to run selected groups of tasks. Use the
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
