freebsd-postinstall
===================

[![Build Status](https://travis-ci.org/vbotka/ansible-freebsd-postinstall.svg?branch=master)](https://travis-ci.org/vbotka/ansible-freebsd-postinstall)

[Ansible role.](https://galaxy.ansible.com/vbotka/freebsd-postinstall/) FreeBSD. Post-install configuration: aliases, apcupsd, authorized keys, cron, fstab, gitserver, hostapd, hostname, hosts, libmap, loader.conf, make.conf, motd, nfsd, ntpd, ntpdate, procmail, resolvconf.conf, smartd, sudoers, ssh, swap, sysctl, timezone, users, packages and ports, overlays, wip ...


Requirements
------------

None.


Variables
---------

Review defaults and examples in vars.

freebsd_install_method
----------------------

By default *freebsd_install_method* is set to install packages. Installation is faster. But, later, after having upgraded
from the ports (*portmaster -a*) switch the method to *ports*.

```
freebsd_install_method: "packages"
#freebsd_install_method: "ports"
#freebsd_use_packages: "yes"
```

Optionaly the packages can be built by [freebsd-poudriere](https://galaxy.ansible.com/vbotka/freebsd-poudriere) and installed by [freebsd-packages](https://galaxy.ansible.com/vbotka/freebsd-packages)


freebsd_use_packages
--------------------

Role [freebsd-ports](https://galaxy.ansible.com/vbotka/freebsd-ports) will install packages if this option is set.

```
#freebsd_install_method: "packages"
freebsd_install_method: "ports"
freebsd_use_packages: "yes"
```


Workflow
--------

1) Change shell to /bin/sh.

```
ansible host -e 'ansible_shell_type=csh ansible_shell_executable=/bin/csh' -a 'sudo pw usermod user -s /bin/sh'
```

2) Install role.

```
ansible-galaxy install vbotka.freebsd-postinstall
```

3) Fit variables.

```
editor vbotka.freebsd-postinstall/vars/main.yml
```

4) Create playbook.

```
cat freebsd-postinstall.yml
- hosts: host
  roles:
    - role: vbotka.ansible-freebsd-postinstall
```

5) Configure the system.

```
ansible-playbook freebsd-postinstall.yml
```

License
-------

[![license](https://img.shields.io/badge/license-BSD-red.svg)](https://www.freebsd.org/doc/en/articles/bsdl-gpl/article.html)


Author Information
------------------

[Vladimir Botka](https://botka.link)


References
----------
- [FreeBSD handbook: Post-Installation](https://www.freebsd.org/doc/handbook/bsdinstall-post.html)
- [apcupsd - FreeBSD diary: Configuring a UPS daemon](http://www.freebsddiary.org/apcupsd.php)
- [cron - FreeBSD handbook: Configuring cron](https://www.freebsd.org/doc/handbook/configtuning-cron.html)
- [git - FreeBSD forum: How to setup a Git repository](https://forums.freebsd.org/threads/10810/)
- [git - Getting Git on a Server](https://git-scm.com/book/ch4-2.html)
- [hostapd - Atheros wireless driver support](https://wiki.freebsd.org/dev/ath%284%29)
- [loader.conf - FreeBSD handbook: FreeBSD Boot Process](https://www.freebsd.org/doc/handbook/boot-introduction.html)
- [make.conf - FreeBSD forum: Prioritizing SSL/TLS in make.conf](https://forums.freebsd.org/threads/62930/)
- [make.conf - FreeBSD wiki: Design for Flavors and Sub Packages](https://wiki.freebsd.org/Ports/FlavorsAndSubPackages)
- [make.conf - GNU emacs flavours in FreeBSD](https://ximalas.info/2018/02/02/gnu-emacs-flavours-in-freebsd/)
- [nfs - FreeBSD handbook: Network File System (NFS)](https://www.freebsd.org/doc/handbook/network-nfs.html)
- [ntp - FreeBSD handbook: Clock Synchronization with NTP](http://www.freebsd.org/doc/handbook/network-ntp.html)
- [ntp - FreeBSD forum: Testing NTP](https://forums.freebsd.org/threads/41874/)
- [ntp - NTP Support Wiki](http://support.ntp.org/bin/view/Main/WebHome)
- [ntp - How to use pool.ntp.org](http://www.pool.ntp.org/en/use.html)
- [ports - FreeBSD handbook: Upgrading Ports Using Portmaster](https://www.freebsd.org/doc/handbook/ports-using.html)
- [procmail - Documentation Project](http://pm-doc.sourceforge.net/)
- [sudo - FreeBSD handbook: Shared Administration with Sudo](https://www.freebsd.org/doc/handbook/security-sudo.html)
- [swap - FreeBSD handbook: Adding Swap Space](http://www.freebsd.org/doc/handbook/adding-swap-space.html)
