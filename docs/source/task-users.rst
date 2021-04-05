users
-----

Manage users.

**Example**

Enable management of users (3) and create list of the users (4). For example

.. code-block:: sh
   :emphasize-lines: 3,4
   :linenos:

   shell> cat host_vars/build.example.com/fp-users.yml
   ---
   fp_users: true
   fp_users_conf:
     - name: admin
       shell: /bin/sh
       groups: [wheel]
     - name: responder
       shell: /usr/sbin/nologin
     - name: freebsd
       state: absent
   ...

Dry-run the tasks, display the variables, and display the changes ::

   shell> ansible-playbook playbook.yml -t fp_users -e fp_users_debug=true -CD

If all seems to be right configure the users ::

   shell> ansible-playbook playbook.yml -t fp_users

.. seealso::

   * Annotated Source code :ref:`as_users.yml`
