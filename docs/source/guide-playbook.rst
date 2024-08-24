.. _ug_playbook:

Playbook
========

Create ``playbook.yml`` that calls this role (9) at a single host, for example, *test_14.example.com* (1)

.. code-block:: yaml
   :linenos:
   :emphasize-lines: 1,9

   - hosts: test_14.example.com
     gather_facts: true
     connection: ssh
     remote_user: admin
     become: true
     become_user: root
     become_method: sudo
     roles:
       - vbotka.freebsd_postinstall

.. note::

   Enable ``gather_facts: true`` (2). See `Discovering variables`_. The
   discovered variables are needed to customize the role. Consider
   `Cache Plugins`_ to speedup the play.

.. seealso::

   * For details see `Connection Plugins`_ (3-4) and
   * `Understanding Privilege Escalation`_ (5-7)

.. _`Discovering variables`: https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_vars_facts.html
.. _`Cache Plugins`: https://docs.ansible.com/ansible/2.9/plugins/cache.html?highlight=cache_plugin#cache-plugins
.. _`Connection Plugins`: https://docs.ansible.com/ansible/latest/plugins/connection.html
.. _`Understanding Privilege Escalation`: https://docs.ansible.com/ansible/latest/user_guide/become.html#understanding-privilege-escalation
