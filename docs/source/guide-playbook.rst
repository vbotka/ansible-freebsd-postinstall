.. _ug_playbook:

Playbook
========

Create ``playbook.yml`` that calls this role (9) at a single host
*test_14.example.com* (1)

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

.. note:: Enable ``gather_facts: true`` (2) to collect facts.

.. seealso::
   * For details see `Connection Plugins <https://docs.ansible.com/ansible/latest/plugins/connection.html>`_ (3-4)
   * See also `Understanding Privilege Escalation <https://docs.ansible.com/ansible/latest/user_guide/become.html#understanding-privilege-escalation>`_ (5-7)
