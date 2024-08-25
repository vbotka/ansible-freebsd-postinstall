Passwords *(passwords)*
-----------------------

Manage users' passwords. At the moment only ``passwordstore`` *Unix
password manager* is implemented.

passwordstore
^^^^^^^^^^^^^

Create passwords in ``passwordstore`` and enable access for the user
who is running the playbook. For example, ::

    shell> pass build.example.com/
    build.example.com
    ├── admin
    └── root

Configure the variables:

* Enable the management of the users' passwords (3)

* Select ``passwordstore`` (4)

* Configure the variable that keeps the name of the host used in
  passwordstore (5). In this case *ansible_nodename*. Next options
  might be *inventory_hostname* (default), *ansible_hostname*, or any
  other custom variable.

.. code-block:: yaml
   :emphasize-lines: 3,4,5
   :linenos:

    shell> cat host_vars/build.example.com/fp-passwords.yml 
    ---
    fp_passwords: true
    fp_passwordstore: true
    fp_passwordstore_hostname_var: ansible_nodename
    ...

Dry-run the tasks, display the variables, and display the changes ::

    shell> ansible-playbook playbook.yml -t fp_passwords -e fp_passwords_debug=true -CD

If all seems to be right manage the users' passwords ::

    shell> ansible-playbook playbook.yml -t fp_passwords

.. seealso::
   * Annotated Source code :ref:`as_passwords.yml`
   * Project website `passwordstore.org <https://www.passwordstore.org/>`_
