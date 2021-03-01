.. code-block:: bash
   :emphasize-lines: 1

   shell> ansible-playbook playbook.yml --list-tags

   playbook: playbook.yml

   play #1 (test_14.example.com): test_14.example.com	TAGS: []

      TASK TAGS: [always, fp_aliases, fp_apcupsd, fp_apcupsd_conf,
      fp_apcupsd_rcconf, fp_authorized_key, fp_authorized_key_debug,
      fp_cloud_proividers, fp_copy, fp_copy_debug,
      fp_copy_sync_default, fp_copy_sync_optional,
      fp_copy_unarch_default, fp_copy_unarch_optional, fp_cron,
      fp_cron_debug, fp_cron_rename_entries,
      fp_cron_rename_entries_system, fp_cron_tab, fp_cron_tab_system,
      fp_cron_var, fp_cron_var_system, fp_debug, fp_devfs,
      fp_devfs_conf, fp_devfs_debug, fp_devfs_rcconf, fp_devfs_rcvar,
      fp_devfs_rules, fp_do, fp_do_debug, fp_do_defaul_user_remove,
      fp_do_hostname_rcconf, fp_do_rcconf, fp_fstab, fp_gitserver,
      fp_gitserver_dir, fp_gitserver_group, fp_gitserver_owner,
      fp_groups, fp_groups_conf, fp_groups_debug, fp_groupwrappers,
      fp_groupwrappers_dir, fp_groupwrappers_groupadd,
      fp_groupwrappers_groupdel, fp_groupwrappers_groupmod,
      fp_hostapd, fp_hostapd_conf, fp_hostapd_rcconf, fp_hostname,
      fp_hosts, fp_hosts_conf, fp_hosts_debug, fp_hosts_sanity,
      fp_libmap, fp_linux, fp_linux_debug, fp_linux_fstab,
      fp_linux_lib_copy, fp_linux_lib_dir, fp_linux_lib_link,
      fp_linux_rcconf, fp_loader, fp_loader_debug, fp_login, fp_make,
      fp_make_conf, fp_make_debug, fp_motd, fp_motd_create,
      fp_motd_rcconf, fp_mount_iso, fp_mount_iso_debug, fp_nfs,
      fp_nfs_lockd_rcconf, fp_nfs_rcconf, fp_nfs_statd_rcconf,
      fp_nfsd, fp_ntp, fp_ntp_conf, fp_ntp_rcconf, fp_ntpdate,
      fp_packages, fp_packages_debug, fp_packages_links, fp_passwords,
      fp_passwords_debug, fp_passwords_passwordstore, fp_periodic,
      fp_periodic_conf_local, fp_periodic_debug, fp_procmail,
      fp_procmail_dir, fp_procmail_forward, fp_procmail_forwarders,
      fp_procmail_includerc, fp_procmail_procmailrc,
      fp_resolv_conf_absent, fp_resolvconf, fp_resolvconf_absent,
      fp_resolvconf_conf, fp_smartd, fp_smartd_conf, fp_smartd_rcconf,
      fp_snmpd, fp_snmpd_conf, fp_snmpd_conf_copy, fp_snmpd_rcconf,
      fp_ssh, fp_ssh_config, fp_ssh_debug, fp_sshd, fp_sshd_config,
      fp_sshd_debug, fp_sshd_rcconf, fp_sudoers, fp_swap,
      fp_swap_debug, fp_sysctl, fp_timezone, fp_timezone_debug,
      fp_tmpmfs, fp_tmpmfs_debug, fp_tmpmfs_rcconf, fp_users,
      fp_users_debug, fp_wpasupplicant, fp_wpasupplicant_conf,
      fp_wpasupplicant_conf_file_link, fp_wpasupplicant_conf_rc,
      fp_wpasupplicant_debug, fp_wpasupplicant_rcconf]
