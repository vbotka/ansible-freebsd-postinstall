
.. _ug_bp:

Best practice
=============

Test syntax

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml --syntax-check

See what variables will be included

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t fp_debug -e fp_debug=true

:index:`Dry-run`, display differences and display variables

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -e fp_debug=true --check --diff


Install packages. Run this task separately if the installation takes too long. Then disable it.

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -t fp_packages -e fp_install=true

Run the playbook

.. code-block:: console
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml -e fp_install=false

Test the :index:`idempotency`. The role and the configuration data shall be idempotent. There
should be no changes reported by *ansible-playbook* when the playbook is run repeatedly. Disable the
debug output, and the installation of packages or ports to speedup the playbook.

.. code-block:: console
   :emphasize-lines: 1

    shell> ansible-playbook playbook.yml
