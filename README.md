# freebsd_postinstall

[![quality](https://img.shields.io/ansible/quality/27910)](https://galaxy.ansible.com/vbotka/freebsd_postinstall)
[![Build Status](https://app.travis-ci.com/vbotka/ansible-freebsd-postinstall.svg?branch=master)](https://app.travis-ci.com/vbotka/ansible-freebsd-postinstall)
[![Documentation Status](https://readthedocs.org/projects/docs/badge/?version=latest)](https://ansible-freebsd-postinstall.readthedocs.io/en/latest/)
[![GitHub tag](https://img.shields.io/github/v/tag/vbotka/ansible-freebsd-postinstall)](https://github.com/vbotka/ansible-freebsd-postinstall/tags)

This role is included in the collection [vbotka.freebsd](https://galaxy.ansible.com/ui/repo/published/vbotka/freebsd/)

Ansible role [vbotka.freebsd_postinstall](https://galaxy.ansible.com/vbotka/freebsd_postinstall/) at galaxy.ansible.com

FreeBSD post-install configuration: aliases, apcupsd, authorized keys, cron,
devfs, dhclient, freebsd-update, fstab, groups, hostapd, hostname, hosts, inetd,
libmap, linux compatibility, login.conf, loader.conf, make.conf, motd, nfsd,
ntpd, ntpdate, procmail, qemu, resolvconf.conf, smartd, snmpd, sudoers, ssh,
sshd, swap, sysctl, syslog, timezone, tmpmfs, users, packages and ports,
periodic.conf, overlays, wpa_supplicant, (wip) ...

Documentation [Ansible role FreeBSD postinstall](https://ansible-freebsd-postinstall.readthedocs.io) at readthedocs.io

This role and the documentation is work in progress. If the documentation of a task is missing it's necessary to review the [source code](https://github.com/vbotka/ansible-freebsd-postinstall/tree/master/tasks) to learn how to use it. If a functionality is missing consider role [config_light](https://galaxy.ansible.com/vbotka/config_light). See various [examples](https://github.com/vbotka/ansible-config-light/tree/master/contrib). If *config_light* is not able to do what you want create new tasks.

Feel free to [share your feedback and report issues](https://github.com/vbotka/ansible-freebsd-postinstall/issues).

[Contributions are welcome](https://github.com/firstcontributions/first-contributions).


## Supported platforms

This role has been developed and tested with [FreeBSD Supported Releases](https://www.freebsd.org/releases/).


## Requirements and dependencies

### Collections

* [ansible.posix](https://github.com/ansible-collections/ansible.posix/)
* [ansible.utils](https://github.com/ansible-collections/ansible.utils/)
* [community.general](https://github.com/ansible-collections/community.general/)
* [vbotka.freebsd](https://github.com/vbotka/ansible-collection-freebsd/)

### Packages

* [fqdn](https://pypi.org/project/fqdn/) required by [community.general.fqdn_valid](https://docs.ansible.com/ansible/latest/collections/community/general/fqdn_valid_test.html)
* [jc](https://pypi.org/project/jc/) required by [community.general.jc](https://docs.ansible.com/ansible/latest/collections/community/general/jc_filter.html)
* [rsync](https://rsync.samba.org/) required by [ansible.posix.synchronize](https://docs.ansible.com/ansible/latest/collections/ansible/posix/synchronize_module.html)

* See the dictionaries pkg_dict_* in defaults/main/pkgdict_*.yml


## Variables

Review defaults and examples in vars.


## freebsd_install_method

By default *freebsd_install_method* is set to install packages. Installation is
faster. But, later, after having upgraded from the ports (*portmaster -a*)
switch the method to *ports*.

```yaml
freebsd_install_method: packages
#freebsd_install_method: ports
#freebsd_use_packages: true
```

Optionally, the packages can be built by [freebsd_poudriere](https://galaxy.ansible.com/vbotka/freebsd_poudriere) and installed by [freebsd_packages](https://galaxy.ansible.com/vbotka/freebsd_packages).


## freebsd_use_packages

Role [freebsd_ports](https://galaxy.ansible.com/vbotka/freebsd_ports) installs packages if this option is set.

```yaml
#freebsd_install_method: packages
freebsd_install_method: ports
freebsd_use_packages: true
```


## Workflow

1) On the remote hosts, change shell to /bin/sh for the remote user if necessary

```bash
ansible host -e ansible_shell_type=csh -e ansible_shell_executable=/bin/csh -a 'sudo pw usermod user -s /bin/sh'
```

2) Install the role

```bash
ansible-galaxy role install vbotka.freebsd_postinstall
```

and install the collections if necessary

```bash
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install ansible.utils
ansible-galaxy collection install community.general
ansible-galaxy collection install vbotka.freebsd
```

3) Fit variables to your needs.

4) Create the playbook *freebsd-postinstall.yml*

```yaml
- hosts: host
  roles:
    - vbotka.freebsd_postinstall
```

See the [Best practice](https://ansible-freebsd-postinstall.readthedocs.io/en/latest/guide-best-practice.html).

5) Configure the system

```yaml
ansible-playbook freebsd-postinstall.yml
```


## Ansible lint

Use the configuration file *.ansible-lint.local* when running *ansible-lint*. Some rules might be
disabled and some warnings might be ignored. See the notes in the configuration file.

```bash
shell> ansible-lint -c .ansible-lint.local
```


## Configure the role

The playbook *.configure.yml* provides blocks of tasks to configure the
role. Read it to understand the details.


## Ansible Galaxy Import log lint errors v2.7.8

Ansible itself causes the following lint errors:

* Wrong indentation

```
ansible-freebsd-postinstall/docs/annotation/annotation-tasks.yml:639: yaml[indentation][/]: Wrong indentation: expected 8 but found 6 
ansible-freebsd-postinstall/docs/annotation/annotation-tasks.yml:642: yaml[indentation][/]: Wrong indentation: expected 8 but found 6 
ansible-freebsd-postinstall/docs/annotation/annotation-tasks.yml:689: yaml[indentation][/]: Wrong indentation: expected 8 but found 6 
ansible-freebsd-postinstall/docs/annotation/annotation-tasks.yml:691: yaml[indentation][/]: Wrong indentation: expected 8 but found 6 
ansible-freebsd-postinstall/docs/annotation/annotation-tasks.yml:693: yaml[indentation][/]: Wrong indentation: expected 8 but found 6 
ansible-freebsd-postinstall/docs/annotation/annotation-tasks.yml:1443: yaml[indentation][/]: Wrong indentation: expected 8 but found 6 
```

The filter *to_nice_yaml* creates invalid YAML output. For example,

```yaml
    - debug:
        msg: "{{ foo | to_nice_yaml(indent=2) }}"
      vars:
        foo:
          bar: [alice, bob]
```

gives

```yaml
    msg: |-
        bar:
        - alice
        - bob
```

* galaxy_info.platforms[0].versions[0] 13.4 is not one of ['6.1', '7.1', '7.2', 'all']

FreeBSD 13.4 is not one of (very probably RH versions). Of course, it isn't. The error message also
says:

```
See https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_reuse_roles.html#using-role-dependencies
```

This link has nothing to do with this error.

* unknown-module - couldn't resolve module/action 'community.general.sysrc'

The module [community.general.sysrc](https://docs.ansible.com/ansible/latest/collections/community/general/sysrc_module.html) is unknown?!


## License

[![license](https://img.shields.io/badge/license-BSD-red.svg)](https://www.freebsd.org/doc/en/articles/bsdl-gpl/article.html)


## Author Information

[Vladimir Botka](https://botka.info)


## References

- [FreeBSD handbook: Post-Installation](https://docs.freebsd.org/en/books/handbook/bsdinstall/#bsdinstall-post)
- [aliases - FreeBSD handbook: Sendmail Configuration Files](https://docs.freebsd.org/en/books/handbook/mail/#sendmail)
- [apcupsd - FreeBSD diary: Configuring a UPS daemon](http://www.freebsddiary.org/apcupsd.php)
- [cron - FreeBSD handbook: Configuring cron](https://docs.freebsd.org/en/books/handbook/config/#configtuning-cron)
- [devd - man 8](https://man.freebsd.org/cgi/man.cgi?devd)
- [devd.conf - man 5](https://man.freebsd.org/cgi/man.cgi?devd.conf)
- [devfs - man 5](https://www.freebsd.org/cgi/man.cgi?query=devfs&sektion=5)
- [devfs - man 8](https://www.freebsd.org/cgi/man.cgi?query=devfs&sektion=8)
- [devfs.conf - man](https://www.freebsd.org/cgi/man.cgi?devfs.conf)
- [devfs.rules - man](https://www.freebsd.org/cgi/man.cgi?query=devfs.rules&sektion=5&n=1)
- [devfs rules - FreeBSD Wiki](https://forums.freebsd.org/threads/devfs-rules.56172/)
- [devfs rules not applied by default for jails - FreeBSD-SA-14:07.devfs](https://www.freebsd.org/security/advisories/FreeBSD-SA-14:07.devfs.asc)
- [dhclient - FreeBSD handbook: Dynamic Host Configuration Protocol (DHCP)](https://docs.freebsd.org/en/books/handbook/network-servers/index.html#network-dhcp)
- [dhclient - man 8](https://man.freebsd.org/cgi/man.cgi?dhclient)
- [dhclient.conf - man 5](https://man.freebsd.org/cgi/man.cgi?dhclient.conf)
- [dhclient-script - man 8](https://man.freebsd.org/cgi/man.cgi?dhclient-script)
- [freebsd-update - FreeBSD handbook: FreeBSD Update](https://docs.freebsd.org/en/books/handbook/cutting-edge/#updating-upgrading-freebsdupdate)
- [fstab - FreeBSD handbook: Mounting and Unmounting File Systems](https://docs.freebsd.org/en/books/handbook/basics/#mount-unmount)
- [git - FreeBSD forum: How to setup a Git repository](https://forums.freebsd.org/threads/10810/)
- [git - Getting Git on a Server](https://git-scm.com/book/ch4-2.html)
- [hostapd - Atheros wireless driver support](https://wiki.freebsd.org/dev/ath%284%29)
- [inetd - FreeBSD handbook: The inetd Super-Server](https://docs.freebsd.org/en/books/handbook/network-servers/#network-inetd)
- [login.conf - FreeBSD handbook: Resource Limits](https://docs.freebsd.org/en/books/handbook/security/#security-resourcelimits)
- [linux - FreeBSD handbook: Linux Binary Compatibility](https://docs.freebsd.org/en/books/handbook/linuxemu/)
- [linprocfs - FreeBSD man](https://www.freebsd.org/cgi/man.cgi?linprocfs(5))
- [loader.conf - FreeBSD handbook: FreeBSD Boot Process](https://docs.freebsd.org/en/books/handbook/boot/#boot-introduction)
- [make.conf - FreeBSD forum: Prioritizing SSL/TLS in make.conf](https://forums.freebsd.org/threads/62930/)
- [make.conf - FreeBSD wiki: Design for Flavors and Sub Packages](https://wiki.freebsd.org/Ports/FlavorsAndSubPackages)
- [make.conf - GNU emacs flavours in FreeBSD](https://ximalas.info/2018/02/02/gnu-emacs-flavours-in-freebsd/)
- [mount - FreeBSD handbook: Mounting and Unmounting File Systems](https://docs.freebsd.org/en/books/handbook/basics/#mount-unmount)
- [nfs - FreeBSD handbook: Network File System (NFS)](https://docs.freebsd.org/en/books/handbook/network-servers/#network-nfs)
- [nfsd - FreeBSD forum: NFSv4 without Kerberos](https://forums.freebsd.org/threads/nfsv4-without-kerberos.71899/)
- [ntp - FreeBSD handbook: Clock Synchronization with NTP](https://docs.freebsd.org/en/books/handbook/network-servers/#network-ntp)
- [ntp - FreeBSD forum: Testing NTP](https://forums.freebsd.org/threads/41874/)
- [ntp - NTP Support Wiki](http://support.ntp.org/bin/view/Main/WebHome)
- [ntp - How to use pool.ntp.org](http://www.pool.ntp.org/en/use.html)
- [periodic.conf - FreeBSD forum: periodic and cron doubt](https://forums.freebsd.org/threads/periodic-and-cron-doubt.27471/)
- [ports - FreeBSD handbook: Upgrading Ports Using Portmaster](https://docs.freebsd.org/en/books/handbook/ports/#ports-using)
- [procmail - Documentation Project](http://pm-doc.sourceforge.net/)
- [qemu - FreeBSD Wiki: Qemu on FreeBSD as host](https://wiki.freebsd.org/qemu)
- [qemu - QEMU Wiki: Hosts/BSD](https://wiki.qemu.org/Hosts/BSD)
- [resolv.conf - FreeBSD handbook: Configuration Files](https://docs.freebsd.org/en/books/handbook/config/#configtuning-configfiles)
- [smartd - FreeBSD forum: camcontrol hdd smart status](https://forums.freebsd.org/threads/camcontrol-hdd-smart-status.65306/)
- [snmp - Install and configure snmp in Freebsd](http://blog.up-link.ro/freebsd-how-to-install-and-configure-snmp-in-freebsd/)
- [snmp - Simple Network Management Protocol (SNMP)](http://www.net-snmp.org/)
- [ssh - FreeBSD handbook: OpenSSH](https://docs.freebsd.org/en/books/handbook/security/#openssh)
- [ssl - OpenSSL Wiki](https://wiki.freebsd.org/OpenSSL)
- [sudo - FreeBSD handbook: Shared Administration with Sudo](https://docs.freebsd.org/en/books/handbook/security/#security-sudo)
- [swap - FreeBSD handbook: Adding Swap Space](https://docs.freebsd.org/en/books/handbook/config/#adding-swap-space)
- [sysctl - FreeBSD handbook: Tuning with sysctl](https://docs.freebsd.org/en/books/handbook/config/#configtuning-sysctl)
- [syslog - FreeBSD handbook: Configuring System Logging](https://docs.freebsd.org/en/books/handbook/config/#configtuning-syslog)
- [timezone - How to set up FreeBSD for my region?](https://unix.stackexchange.com/questions/34567/how-to-set-up-freebsd-for-my-region)
- [tmpmfs - FreeBSD forum: Questions about ramdisk in FreeBSD](https://forums.freebsd.org/threads/questions-about-ramdisk-in-freebsd.20345/)
- [tmpfs - FreeBSD forum: /dev/shm | md questions](https://forums.freebsd.org/threads/tmpfs-dev-shm-md-questions.45210/)
- [users - FreeBSD handbook: Adding Users and Groups](https://docs.freebsd.org/en/books/porters-handbook/special/#users-and-groups)
- [vars - FreeBSD Wiki: Ports/DEFAULT_VERSIONS](https://wiki.freebsd.org/Ports/DEFAULT_VERSIONS)
- [wpa_supplicant - Project site](https://w1.fi/wpa_supplicant/)
- [wpa_supplicant - FreeBSD handbook: Wireless Networking](https://docs.freebsd.org/en/books/handbook/advanced-networking/#network-wireless)


## Cloud providers

- [DigitalOcean - Ansible community](https://www.digitalocean.com/community/tags/ansible)
- [DigitalOcean - Some pre-defined services in /etc/rc.conf](https://www.digitalocean.com/community/questions/some-pre-defined-services-in-etc-rc-conf-i-want-to-remove-in-freebsd)
