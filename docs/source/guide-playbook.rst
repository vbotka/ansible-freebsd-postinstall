.. _ug_playbook:

Playbook
========

Create simple playbook that calls this role (10) at a single host test_14.example.com (2)

.. code-block:: sh
   :emphasize-lines: 2,10
   :linenos:

   shell> cat playbook.yml
   - hosts: test_14.example.com
     gather_facts: true
     connection: ssh
     remote_user: admin
     become: true
     become_user: root
     become_method: sudo
     roles:
       - vbotka.freebsd_postinstall

.. note:: Enable ``gather_facts: true`` (3) to collect facts.

.. seealso::
   * For details see `Connection Plugins <https://docs.ansible.com/ansible/latest/plugins/connection.html>`_ (4-5)
   * See also `Understanding Privilege Escalation <https://docs.ansible.com/ansible/latest/user_guide/become.html#understanding-privilege-escalation>`_ (6-8)
