.. code-block:: sh
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_debug -e fp_debug=true

   PLAY [test_14.example.com] *******************************************************************

   TASK [Gathering Facts] ***********************************************************************
   ok: [test_14.example.com]

   TASK [vbotka.freebsd_postinstall : FreeBSD postinstall Debug] ********************************
   ok: [test_14.example.com] => 
     msg: |-
       ansible_architecture: amd64
       ansible_os_family: FreeBSD
       ansible_distribution: FreeBSD
       ansible_distribution_major_version: 13
       ansible_distribution_version: 13.0
       ansible_distribution_release: 13.0-RELEASE-p13
  
       rc_conf_hostname: test_14.example.com
       fp_domain: example.com
       aws: False
       digitalocean: False
       gcp: False
  
       freebsd_install_method: packages
       freebsd_use_packages: UNDEFINED
       freebsd_install_retries: 10
       freebsd_install_delay: 5
  
       fp_install: False
       fp_backup: True
       fp_sanity: True fp_sanity_tags_fatal: True
  
       fp_aliases: False
       fp_apcupsd: False fp_apcupsd_install: False fp_apcupsd_enabled: False
       fp_authorized_key: True
       fp_copy: False fp_unarch_default: False fp_unarch_optional: False
       fp_cron: False
       fp_devfs: False fp_devfs_enabled: False
       fp_fstab: False
       fp_gitserver: False fp_gitserver_install: False
       fp_groups: False
       fp_groupwrappers_install: False
       fp_hostapd: False fp_hostapd_install: False fp_hostapd_enabled: False
       fp_hostname: True
       fp_linux: False fp_linux_install: False fp_linux_enable: False
       fp_loader: False fp_loader_warning: True
       fp_login: False fp_login_conf_global: False
       fp_make: False
       fp_motd: False
       fp_mount_img: False
       fp_mount_iso: False
       fp_nfs: False fp_nfs_enable: False
       fp_nfsd: False fp_nfsd_enable: False
       fp_ntp: False fp_ntp_enable: False
       fp_ntpdate: False
       fp_passwords: False
       fp_periodic: False
       fp_procmail: False fp_procmail_install: False
       fp_qemu: False fp_qemu_enabled: False fp_qemu_install: False fp_qemu_user_static_install: False
       fp_resolvconf: False
       fp_smartd: False fp_smartd_install: False fp_smartd_enabled: False
       fp_snmpd: False fp_snmpd_install: False fp_snmpd_enabled: False
       fp_ssh: False
       fp_sshd: True fp_sshd_enable: True
       fp_sudoers: True
       fp_swap: False fp_swap_enable: False
       fp_sysctl: False
       fp_timezone: True
       fp_tmpmfs: False
       fp_users: True
       fp_wpasuppliant: False fp_wpasuppliant_install: False
  
       fp_mountd_enable: False
       fp_rpcbind_enable: False
       fp_rpc_lockd_enable: False
       fp_rpc_statd_enable: False

   PLAY RECAP ***********************************************************************************
   test_14.example.com: ok=2    changed=0    unreachable=0    failed=0    skipped=5    rescued=0    ignored=0
