#!/bin/bash
#
# Synchronize data from HOSTS/DIRS to COPYDIR.
# Data can be used with Ansible role freebsd-postinstall.
# Example:
# ansible-playbook -e 'fp_synchronize_optional=yes' \
    # ~/.ansible/playbooks/srv.example.com-freebsd-postinstall.yml \
    # -t fp_synchronize_optional

RSYNC="/usr/bin/rsync"
RSYNCPARAM="avzl"
SSH="/usr/bin/ssh"
COPYDIR="$HOME/.ansible/playbooks/copy"
REMOTEUSER="admin"
#DRYRUN="-n"
DRYRUN=""
VERBOSE="1"

function sync {
    for i in $HOSTS; do
	if ($SSH -q -o "BatchMode=yes" -o "ConnectTimeout=3" $REMOTEUSER@$i :); then
	    (($VERBOSE)) && printf "* $i *\n"
	    for j in $DIRS; do
		(($VERBOSE)) && printf "  $j "
		if LOG=$($SSH $REMOTEUSER@$i "[ -d $j ]" 2>&1); then
	            (($VERBOSE)) && printf "exists. "
		    if [ ! -e "$COPYDIR/$i/$j" ]; then
			mkdir -p $COPYDIR/$i$j
		    fi
		    cd $COPYDIR/$i$j
		    if LOG=$($RSYNC $DRYRUN -$RSYNCPARAM -e "ssh" --progress --rsync-path="sudo rsync" \
				    $REMOTEUSER@$i:$j . 2>&1); then
			(($VERBOSE)) && printf "rsync to $COPYDIR/$i$j [OK]\n"
		    else
			printf "rsync [ERR] log: $LOG\n"
		    fi
		else
		    printf "does not exist. [WRN]\n"
		fi
	    done
	else
	    printf "[ERR] Can\'t connect to $REMOTEUSER@$i\n"
	fi

    done
}

if [ ! -e "$COPYDIR" ]; then
    if mkdir -p $COPYDIR; then
	(($VERBOSE)) && printf "$COPYDIR created.\n"
    else
	printf "[ERR] Can\'t create $COPYDIR.\n"
	exit 1
    fi
fi

[[ "$DRYRUN" == "-n" ]] && (($VERBOSE)) && printf "* DRYRUN *\n"

HOSTS="srv.example.com
mail.example.com
www.example.com"
DIRS="/usr/local/etc/letsencrypt/
/var/db/ports/"
sync

HOSTS="ns1.example.com
ns2.example.com"
DIRS="/usr/local/etc/namedb/keys/"
sync

# EOF
