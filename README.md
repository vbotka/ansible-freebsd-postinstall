freebsd-postinstall
===================

[![Build Status](https://travis-ci.org/vbotka/ansible-freebsd-postinstall.svg?branch=master)](https://travis-ci.org/vbotka/ansible-freebsd-postinstall)

[Ansible role](https://galaxy.ansible.com/vbotka/ansible-freebsd-postinstall/). Post-install configuration of FreeBSD
- configure hostname
- configure swap
- configure fstab
- configure libmap
- configure ssh
- configure ntpd
- configure ntpdate
- configure timezone
- configure smartd
- configure hostapd
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
    - role: vbotka.ansible-freebsd-tpostinstall
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

