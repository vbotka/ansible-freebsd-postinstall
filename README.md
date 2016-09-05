freebsd-postinstall
===================

[![Build Status](https://travis-ci.org/vbotka/ansible-freebsd-postinstall.svg?branch=master)](https://travis-ci.org/vbotka/ansible-freebsd-postinstall)
![license](https://img.shields.io/badge/license-BSD-red.svg)

Ansible role. Postinstallation configuration of FreeBSD (fstab, packages, ssh, ntpdate,
timezone, users, authorized_key).

https://galaxy.ansible.com/vbotka/ansible-freebsd-postinstall/

Requirements
------------

None.


Variables
---------

TBD (Check the defaults).


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

BSD


Author Information
------------------

[Vladimir Botka](https://botka.link)


References
----------

[FreeBSD handbook: Post-Installation]
(https://www.freebsd.org/doc/handbook/bsdinstall-post.html)
