#!/bin/bash

# All rights reserved (c) 2020, Vladimir Botka <vbotka@gmail.com>
# Simplified BSD License, https://opensource.org/licenses/BSD-2-Clause

# This file is part of Ansible role vbotka.freebsd_postinstall
# https://galaxy.ansible.com/vbotka/freebsd_postinstall
# https://github.com/vbotka/ansible-freebsd-postinstall/blob/master/contrib/copy-rsync.sh

# Synchronize data from HOSTS/DIRS to COPYDIR.
# Data can be used in Ansible role vbotka.freebsd_postinstall
# Example:
# ansible-playbook -e 'fp_synchronize_optional=yes' \
# ~/.ansible/playbooks/srv.example.com-freebsd-postinstall.yml \
# -t fp_synchronize_optional

VERSION="1.0"

RSYNC="/usr/bin/rsync"
RSYNCPARAM="avzli"
SSH="/usr/bin/ssh"
COPYDIR="$HOME/.ansible/copy"
REMOTEUSER="admin"
DRYRUN="-n"
# DRYRUN=""
VERBOSE="1"

function sync {
    for i in $HOSTS; do
	if ($SSH -q -o "BatchMode=yes" -o "ConnectTimeout=3" $REMOTEUSER@$i :); then
	    (($VERBOSE)) && printf "[OK] $i connected.\n"
	    for j in $DIRS; do
		if LOG=$($SSH $REMOTEUSER@$i "[ -d $j ]" 2>&1); then
	            (($VERBOSE)) && printf "[OK] $j exists.\n "
		    if [ ! -e "$COPYDIR/$i/$j" ]; then
			mkdir -p $COPYDIR/$i$j
		    fi
		    cd $COPYDIR/$i$j
		    if LOG=$($RSYNC $DRYRUN -$RSYNCPARAM -e "ssh" --progress --rsync-path="sudo rsync" $REMOTEUSER@$i:$j . 2>&1); then
			(($VERBOSE)) && printf "$LOG\n"
			(($VERBOSE)) && printf "[OK] rsync to $COPYDIR/$i:$j\n"
		    else
			printf "[ERR] rsync log: $LOG\n"
		    fi
		else
		    printf "[WRN] $j does not exist.\n"
		fi
	    done
	else
	    printf "[ERR] Can\'t connect to $REMOTEUSER@$i\n"
	fi
    done
    (($VERBOSE)) && printf "[OK] No more hosts.\n"
}

if [ ! -e "$COPYDIR" ]; then
    if mkdir -p $COPYDIR; then
	(($VERBOSE)) && printf "[OK] $COPYDIR created.\n"
    else
	printf "[ERR] Can\'t create $COPYDIR.\n"
	exit 1
    fi
fi

[[ "$DRYRUN" == "-n" ]] && (($VERBOSE)) && printf "* DRYRUN * DRYRUN * DRYRUN * DRYRUN * DRYRUN * DRYRUN * DRYRUN * DRYRUN * DRYRUN * DRYRUN *\n"

# ----------------------------------------------------------------------------
# HOSTS="srv.example.com
# mail.example.com
# www.example.com"
# DIRS="/usr/local/etc/letsencrypt/
# /var/db/ports/"
# sync
#
# HOSTS="ns1.example.com
# ns2.example.com"
# DIRS="/usr/local/etc/namedb/keys/"
# sync

# EOF
