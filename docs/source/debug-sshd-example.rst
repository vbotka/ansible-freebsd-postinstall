.. code-block:: sh
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_sshd_debug -e fp_sshd_debug=true

   PLAY [test_14.example.com] *******************************************************************

   TASK [Gathering Facts] ***********************************************************************
   ok: [test_14.example.com]

   TASK [vbotka.freebsd_postinstall : sshd: Debug (fp_sshd_debug=true)] *************************
   ok: [test_14.example.com] =>
     msg: |-
        fp_sshd_bin: /usr/sbin/sshd
        fp_sshd_conf_file: /etc/ssh/sshd_config
        fp_sshd_conf:
          - {key: PasswordAuthentication, value: 'no'}
          - {key: ChallengeResponseAuthentication, value: 'no'}
          - {key: PermitRootLogin, value: 'no'}
          - {key: PermitTunnel, value: 'no'}
          - {key: AllowTcpForwarding, value: 'yes'}
          - {key: X11Forwarding, value: 'no'}
          - {key: UseBlacklist, value: 'yes'}

   PLAY RECAP ***********************************************************************************
   test_14.example.com: ok=2 changed=0 unreachable=0 failed=0 skipped=3 rescued=0 ignored=0
