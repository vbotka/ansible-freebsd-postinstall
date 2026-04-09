.. code-block:: yaml
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_debug -e fp_debug=true

   PLAY [test_14.example.com] *******************************************************************

   TASK [Gathering Facts] ***********************************************************************
   ok: [test_14.example.com]

   TASK [vbotka.freebsd_postinstall : FreeBSD postinstall Debug] ********************************
   ok: [test_14.example.com] => 
     msg: |-
       fp_role_version: 2.6.12
       ansible_architecture: amd64
       ansible_os_family: FreeBSD
       ansible_distribution: FreeBSD
       ansible_distribution_major_version: 14
       ansible_distribution_version: 14.1
       ansible_distribution_release: 14.1-RELEASE
       ansible_python_version: 3.9.18

       rc_conf_hostname: test_14.example.com
       fp_domain: example.com
       aws: False
       digitalocean: False
       gcp: False

       freebsd_install_method: packages
       freebsd_use_packages: True
       freebsd_install_retries: 3
       freebsd_install_delay: 5

       fp_install: True
       fp_backup: True
       fp_vars: False fp_vars_default_versions: False
       fp_sanity: True fp_sanity_tags_fatal: True

       fp_aliases: True
       fp_apcupsd: True fp_apcupsd_install: True fp_apcupsd_enabled: False
       fp_authorized_key: True
       fp_copy: True fp_unarch_default: False fp_unarch_optional: False
       fp_cron: True
       fp_devfs: False fp_devfs_enabled: False
       fp_dhclient: False
       fp_freebsd_update: False
       fp_fstab: True
       fp_gitserver: False fp_gitserver_install: False
       fp_groups: True
       fp_groupwrappers: True fp_groupwrappers_install: True
       fp_hostapd: False fp_hostapd_install: False fp_hostapd_enabled: False
       fp_hostname: True
       fp_hosts: True
       fp_inetd: False fp_inetd_enabled: False
       fp_libmap: False
       fp_linux: True fp_linux_install: False fp_linux_enable: True
       fp_loader: True fp_loader_load_modules: False
       fp_login: True fp_login_conf_global: True
       fp_make: True
       fp_motd: True
       fp_mount_img: False
       fp_mount_iso: True
       fp_nfs: True fp_nfs_enable: True
       fp_nfsd: True fp_nfsd_enable: False
       fp_ntp: True fp_ntp_enable: True
       fp_ntpdate: True fp_ntpdate_enable: False
       fp_passwords: True
       fp_periodic: True
       fp_procmail: True fp_procmail_install: True
       fp_qemu: False fp_qemu_enabled: False fp_qemu_install: False fp_qemu_user_static_install: False
       fp_resolvconf: False
       fp_smartd: True fp_smartd_install: True fp_smartd_enabled: True
       fp_snmpd: False fp_snmpd_install: False fp_snmpd_enabled: False
       fp_ssh: True
       fp_sshd: True fp_sshd_enable: True
       fp_sudoers: True
       fp_swap: True fp_swap_enable: True
       fp_sysctl: True
       fp_syslogd: False fp_syslogd_enabled: False
       fp_timezone: True
       fp_tmpmfs: False
       fp_users: True
       fp_wpasuppliant: True fp_wpasuppliant_install: True

       fp_mountd_enable: True
       fp_rpcbind_enable: True
       fp_rpc_lockd_enable: True
       fp_rpc_statd_enable: True
      ...

   PLAY RECAP ***********************************************************************************
   test_14.example.com: ok=3 changed=0 unreachable=0 failed=0 skipped=7 rescued=0 ignored=0
