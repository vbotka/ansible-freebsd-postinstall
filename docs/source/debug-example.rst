.. code-block:: sh
   :emphasize-lines: 1
   :linenos:

   shell> ansible-playbook playbook.yml -t fp_debug -e fp_debug=true

   PLAY [test_14.example.com] *******************************************************************

   TASK [Gathering Facts] ***********************************************************************
   ok: [test_14.example.com]

   TASK [vbotka.freebsd_postinstall : FreeBSD postinstall Debug] ********************************
   ok: [test_14.example.com] => {
       msg: [
       - ansible_architecture [amd64]
       - ansible_os_family [FreeBSD]
       - ansible_distribution [FreeBSD]
       - ansible_distribution_major_version [12]
       - ansible_distribution_version [12.1]
       - ansible_distribution_release [12.1-RELEASE]
       - ''
       - rc_conf_hostname [plane.g2.netng.org]
       - fp_domain [netng.org]
       - aws [False]
       - digitalocean [False]
       - gcp [False]
       - ''
       - freebsd_install_method [packages]
       - freebsd_use_packages [True]
       - freebsd_install_retries [3]
       - freebsd_install_delay [5]
       - ''
       - fp_install [False]
       - fp_backup [False]
       - fp_sanity [True] fp_sanity_tags_fatal [True]
       - ''
       - fp_aliases [True]
       - fp_apcupsd [False] fp_apcupsd_install [False] fp_apcupsd_enabled [False]
       - fp_authorized_key [True]
       - fp_copy [True] fp_unarch_default [False] fp_unarch_optional [False]
       - fp_cron [True]
       - fp_devfs [False] fp_devfs_enabled [False]
       - fp_fstab [True]
       - fp_gitserver [False] fp_gitserver_install [False]
       - fp_groups [True]
       - fp_groupwrappers_install [True]
       - fp_hostapd [False] fp_hostapd_install [False] fp_hostapd_enabled [False]
       - fp_hostname [True]
       - fp_linux [True] fp_linux_install [False] fp_linux_enable [True]
       - fp_loader [True]
       - fp_login [True]
       - fp_make [True]
       - fp_motd [True]
       - fp_mount_iso [True]
       - fp_nfs [True] fp_nfs_enable [True]
       - fp_nfsd [True] fp_nfsd_enable [False]
       - fp_ntp [True] fp_ntp_enable [True]
       - fp_ntpdate [True]
       - fp_passwords [True]
       - fp_periodic [True]
       - fp_procmail [True] fp_procmail_install [True]
       - fp_resolvconf [False]
       - fp_smartd [True] fp_smartd_install [True] fp_smartd_enabled [True]
       - fp_snmpd [False] fp_snmpd_install [False] fp_snmpd_enabled [False]
       - fp_ssh [True]
       - fp_sshd [True] fp_sshd_enable [True]
       - fp_sudoers [True]
       - fp_swap [False] fp_swap_enable [False]
       - fp_sysctl [True]
       - fp_timezone [True]
       - fp_tmpmfs [False]
       - fp_users [True]
       - fp_wpasuppliant [True] fp_wpasuppliant_install [True]
       - ''
       - fp_mountd_enable [True]
       - fp_rpcbind_enable [True]
       - fp_rpc_lockd_enable [True]
       - fp_rpc_statd_enable [True]
       ]
   }

   PLAY RECAP ***********************************************************************************
   test_14.example.com: ok=2 changed=0 unreachable=0 failed=0 skipped=21 rescued=0 ignored=0
