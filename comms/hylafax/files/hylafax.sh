#!/bin/sh
#
# $NetBSD: apache.sh,v 1.2 1999/05/11 18:38:31 tron Exp $
#

command=${1:-start}

case ${command} in
start)
	if [ -x @PREFIX@/libexec/hfaxd -a -f /var/spool/fax/etc/config ] ; then
	    echo -n 'Starting hfaxd'
	    @PREFIX@/libexec/hfaxd -i 4559 -o 4557 -s 444 

	    echo ' faxq.'
	    @PREFIX@/sbin/faxq
	fi
	;;
stop)
	PIDS=`ps -ax -o pid,command|egrep '[ /](faxq|hfaxd) '|awk '{printf " " $1}'`
	if [ -n "$PIDS" ];then
		echo "Stopping hylafax pids$PIDS."
		kill -TERM $PIDS
	else
		echo "hylafax not running?"
	fi
	;;
restart)
	( $0 stop )
	sleep 1
	$0 start
	;;
esac
exit 0
