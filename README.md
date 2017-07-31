freebsd-postinstall
===================

[![Build Status](https://travis-ci.org/vbotka/ansible-freebsd-postinstall.svg?branch=master)](https://travis-ci.org/vbotka/ansible-freebsd-postinstall)

[Ansible role](https://galaxy.ansible.com/vbotka/freebsd-postinstall/). Post-install configuration of FreeBSD
- configure apcupsd
- configure fstab
- configure gitserver
- configure hostapd
- configure hostname
- configure hosts
- configure libmap
- configure motd
- configure nfsd
- configure ntpd
- configure ntpdate
- configure procmail
- configure smartd
- configure ssh
- configure swap
- configure sysctl
- configure timezone
- add users
- copy authorized_keys
- install packages
- copy overlays

Requirements
------------

None.


Variables
---------

By default *freebsd_install_method* is set to install
packages. Installation is faster. But, later, after having upgraded
from the ports (*portmaster -a*) switch the method to *ports*.

```
freebsd_install_method: "packages"
#freebsd_install_method: "ports"
#freebsd_use_packages: "yes"
```

Review defaults and examples in vars.


Workflow
--------

1) Change shell to /bin/sh.

```
ansible host -e 'ansible_shell_type=csh ansible_shell_executable=/bin/csh' -a 'sudo pw usermod user -s /bin/sh'
```

2) Install role.

```
ansible-galaxy install vbotka.ansible-freebsd-postinstall
```

3) Fit variables.

```
~/.ansible/roles/vbotka.ansible-freebsd-postinstall/vars/main.yml
```

4) Create playbook.

```
> cat ~/.ansible/playbooks/freebsd-postinstall.yml
---
- hosts: example.com
  become: yes
  become_method: sudo
  roles:
    - role: vbotka.ansible-freebsd-postinstall
```

5) Configure the system.

```
ansible-playbook ~/.ansible/playbooks/freebsd-postinstall.yml
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
- [Adding Swap Space](http://www.freebsd.cz/doc/handbook/adding-swap-space.html)
- [Upgrading Ports Using Portmaster](https://www.freebsd.org/doc/handbook/ports-using.html)
- [Procmail Documentation Project](http://pm-doc.sourceforge.net/)
- [Getting Git on a Server](https://git-scm.com/book/ch4-2.html)
- [apcupsd - Configuring a UPS daemon](http://www.freebsddiary.org/apcupsd.php)
- [FreeBSD handbook: Network File System (NFS)](https://www.freebsd.org/doc/handbook/network-nfs.html)
