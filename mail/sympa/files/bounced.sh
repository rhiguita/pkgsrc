#!@RCD_SCRIPTS_SHELL@
#
# $NetBSD: mailman.sh,v 1.1 2004/09/06 06:29:42 lukem Exp $
#
# PROVIDE: bounced
# REQUIRE: sympa
# KEYWORD: shutdown

if [ -f /etc/rc.subr ]
then
	. /etc/rc.subr
fi

name="bounced"
rcvar=$name
command="@PREFIX@/sympa/bin/bounced.pl"
pidfile="/var/sympa/run/bounced.pid"
command_interpreter="@PREFIX@/bin/perl"
sympa_user="sympa"

load_rc_config $name
run_rc_command "$1"
