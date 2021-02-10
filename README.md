# freebsd_postinstall

[![quality](https://img.shields.io/ansible/quality/27910)](https://galaxy.ansible.com/vbotka/freebsd_postinstall)[![Build Status](https://travis-ci.org/vbotka/ansible-freebsd-postinstall.svg?branch=master)](https://travis-ci.org/vbotka/ansible-freebsd-postinstall)

[Ansible role.](https://galaxy.ansible.com/vbotka/freebsd_postinstall/) FreeBSD post-install configuration: aliases, apcupsd, authorized keys, cron, devfs, fstab, gitserver, groups, hostapd, hostname, hosts, libmap, linux compatibility, login.conf, loader.conf, make.conf, motd, nfsd, ntpd, ntpdate, procmail, resolvconf.conf, smartd, snmpd, sudoers, ssh, swap, sysctl, timezone, tmpmfs, users, packages and ports, periodic.conf, overlays, wpa_supplicant, (wip) ...

This role and the documentation is work in progress. If the documentation of a task is missing it's necessary to review the [source code](https://github.com/vbotka/ansible-freebsd-postinstall/tree/master/tasks) to learn how to use it. If a functionality is missing consider role [config_light](https://galaxy.ansible.com/vbotka/config_light). See various [examples](https://github.com/vbotka/ansible-config-light/tree/master/contrib). If *config_light* is not able to do what you want create new tasks.

Feel free to [share your feedback and report issues](https://github.com/vbotka/ansible-freebsd-postinstall/issues). [Contributions are welcome](https://github.com/firstcontributions/first-contributions).


## Requirements

* Ansible role [vbotka.ansible_lib](https://galaxy.ansible.com/vbotka/ansible_lib)


## Variables

Review defaults and examples in vars.


## freebsd_install_method

By default *freebsd_install_method* is set to install packages. Installation is faster. But, later, after having upgraded from the ports (*portmaster -a*) switch the method to *ports*.


```
freebsd_install_method: packages
#freebsd_install_method: ports
#freebsd_use_packages: true
```

Optionaly the packages can be built by [freebsd_poudriere](https://galaxy.ansible.com/vbotka/freebsd_poudriere) and installed by [freebsd_packages](https://galaxy.ansible.com/vbotka/freebsd_packages)



## freebsd_use_packages

Role [freebsd_ports](https://galaxy.ansible.com/vbotka/freebsd_ports) will install packages if this option is set.


```
#freebsd_install_method: packages
freebsd_install_method: ports
freebsd_use_packages: true
```


## Workflow

1) Change shell to /bin/sh

```
ansible host -e 'ansible_shell_type=csh ansible_shell_executable=/bin/csh' -a 'sudo pw usermod user -s /bin/sh'
```

2) Install role

```
ansible-galaxy install vbotka.freebsd_postinstall
```

3) Fit variables

```
editor vbotka.freebsd_postinstall/vars/main.yml
```

4) Create playbook

```
cat freebsd-postinstall.yml
- hosts: host
  roles:
    - vbotka.freebsd_postinstall
```

5) Configure the system

```
ansible-playbook freebsd-postinstall.yml
```

## Notes

1) devfs

"/etc/rc.d/devfs rcvar" returns no variable. As a result module "system" fails

```
fatal: [srv.example.com]: FAILED! => changed=false
  msg: unable to determine rcvar
```

To solve this problem apply the path below

```
--- devfs.orig	2019-07-13 20:31:04.688022000 +0200
+++ devfs	2019-07-13 20:34:49.347159000 +0200
@@ -11,6 +11,7 @@
 . /etc/rc.subr

 name="devfs"
+rcvar="devfs_load_rulesets"
 desc="Device filesystem"
 start_cmd='devfs_start'
 stop_cmd=':'
```

## License

[![license](https://img.shields.io/badge/license-BSD-red.svg)](https://www.freebsd.org/doc/en/articles/bsdl-gpl/article.html)


## Author Information

[Vladimir Botka](https://botka.link)


## References

- [FreeBSD handbook: Post-Installation](https://www.freebsd.org/doc/handbook/bsdinstall-post.html)
- [aliases - FreeBSD handbook: 28.3. Sendmail Configuration Files](http://www.freebsd.org/doc/handbook/sendmail.html)
- [apcupsd - FreeBSD diary: Configuring a UPS daemon](http://www.freebsddiary.org/apcupsd.php)
- [cron - FreeBSD handbook: 11.3. Configuring cron](https://www.freebsd.org/doc/handbook/configtuning-cron.html)
- [devfs - man 5](https://www.freebsd.org/cgi/man.cgi?query=devfs&sektion=5)
- [devfs - man 8](https://www.freebsd.org/cgi/man.cgi?query=devfs&sektion=8)
- [devfs.conf - man](https://www.freebsd.org/cgi/man.cgi?devfs.conf)
- [devfs.rules - man](https://www.freebsd.org/cgi/man.cgi?query=devfs.rules&sektion=5&n=1)
- [devfs rules - FreeBSD Wiki](https://forums.freebsd.org/threads/devfs-rules.56172/)
- [devfs rules not applied by default for jails - FreeBSD-SA-14:07.devfs](https://www.freebsd.org/security/advisories/FreeBSD-SA-14:07.devfs.asc)
- [fstab - FreeBSD handbook: 3.7. Mounting and Unmounting File Systems](http://www.freebsd.org/doc/handbook/mount-unmount.html)
- [git - FreeBSD forum: How to setup a Git repository](https://forums.freebsd.org/threads/10810/)
- [git - Getting Git on a Server](https://git-scm.com/book/ch4-2.html)
- [hostapd - Atheros wireless driver support](https://wiki.freebsd.org/dev/ath%284%29)
- [login.conf - FreeBSD nadbook: 13.13. Resource Limits](https://www.freebsd.org/doc/handbook/security-resourcelimits.html)
- [linux - FreeBSD handbook: 10. Linux Binary Compatibility](https://www.freebsd.org/doc/handbook/linuxemu.html)
- [linprocfs - FreeBSD man](https://www.freebsd.org/cgi/man.cgi?linprocfs(5))
- [loader.conf - FreeBSD handbook: FreeBSD Boot Process](https://www.freebsd.org/doc/handbook/boot-introduction.html)
- [make.conf - FreeBSD forum: Prioritizing SSL/TLS in make.conf](https://forums.freebsd.org/threads/62930/)
- [make.conf - FreeBSD wiki: Design for Flavors and Sub Packages](https://wiki.freebsd.org/Ports/FlavorsAndSubPackages)
- [make.conf - GNU emacs flavours in FreeBSD](https://ximalas.info/2018/02/02/gnu-emacs-flavours-in-freebsd/)
- [mount - FreeBSD handbook: 3.7. Mounting and Unmounting File Systems](https://www.freebsd.org/doc/handbook/mount-unmount.html)
- [nfs - FreeBSD handbook: Network File System (NFS)](https://www.freebsd.org/doc/handbook/network-nfs.html)
- [nfsd- FreeBSD forum: NFSv4 without Kerberos](https://forums.freebsd.org/threads/nfsv4-without-kerberos.71899/)
- [ntp - FreeBSD handbook: Clock Synchronization with NTP](http://www.freebsd.org/doc/handbook/network-ntp.html)
- [ntp - FreeBSD forum: Testing NTP](https://forums.freebsd.org/threads/41874/)
- [ntp - NTP Support Wiki](http://support.ntp.org/bin/view/Main/WebHome)
- [ntp - How to use pool.ntp.org](http://www.pool.ntp.org/en/use.html)
- [periodic.conf - FreeBSD forum: periodic and cron doubt](https://forums.freebsd.org/threads/periodic-and-cron-doubt.27471/)
- [ports - FreeBSD handbook: Upgrading Ports Using Portmaster](https://www.freebsd.org/doc/handbook/ports-using.html)
- [procmail - Documentation Project](http://pm-doc.sourceforge.net/)
- [resolv.conf - FreeBSD handbook: 11.8. Configuration Files](http://www.freebsd.org/doc/handbook/configtuning-configfiles.html)
- [smartd - FreeBSD forum: camcontrol hdd smart status](https://forums.freebsd.org/threads/camcontrol-hdd-smart-status.65306/)
- [snmp - Install and configure snmp in Freebsd](http://blog.up-link.ro/freebsd-how-to-install-and-configure-snmp-in-freebsd/)
- [snmp - Simple Network Management Protocol (SNMP)](http://www.net-snmp.org/)
- [ssh - FreeBSD handbook: 13.8. OpenSSH](http://www.freebsd.cz/doc/handbook/openssh.html)
- [sudo - FreeBSD handbook: Shared Administration with Sudo](https://www.freebsd.org/doc/handbook/security-sudo.html)
- [swap - FreeBSD handbook: Adding Swap Space](http://www.freebsd.org/doc/handbook/adding-swap-space.html)
- [sysctl - FreeBSD handbook: 11.9. Tuning with sysctl](http://www.freebsd.org/doc/handbook/configtuning-sysctl.html)
- [timezone - How to set up FreeBSD for my region?](https://unix.stackexchange.com/questions/34567/how-to-set-up-freebsd-for-my-region)
- [tmpmfs - FreeBSD forum: Questions about ramdisk in FreeBSD](https://forums.freebsd.org/threads/questions-about-ramdisk-in-freebsd.20345/)
- [tmpfs - FreeBSD forum: /dev/shm | md questions](https://forums.freebsd.org/threads/tmpfs-dev-shm-md-questions.45210/)
- [users - FreeBSD handbook: 6.27. Adding Users and Groups](https://www.freebsd.org/doc/en/books/porters-handbook/users-and-groups.html)
- [wpa_supplicant](https://w1.fi/wpa_supplicant/)
- [wpa_supplicant - 31.3. Wireless Networking](https://www.freebsd.org/doc/handbook/network-wireless.html)

## Cloud providers

- [DigitalOcean - Ansible community](https://www.digitalocean.com/community/tags/ansible)
- [DigitalOcean - Some pre-defined services in /etc/rc.conf](https://www.digitalocean.com/community/questions/some-pre-defined-services-in-etc-rc-conf-i-want-to-remove-in-freebsd)
