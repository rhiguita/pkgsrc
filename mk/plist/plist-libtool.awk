# $NetBSD$
#
# Copyright (c) 2006 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This code is derived from software contributed to The NetBSD Foundation
# by Johnny C. Lam.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. All advertising materials mentioning features or use of this software
#    must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
# 4. Neither the name of The NetBSD Foundation nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
# ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

### This awk script handles libtool archive entries in PLISTs.  This script
### requires the following scripts to be included:
###
###	plist-functions.awk (print_entry)
###
### Certain environment variables must be set prior to running this script:
###
### LIBTOOL_EXPAND is the path to the script that prints out the
###	actual library files associated with a libtool archive file.
###
### LIBTOOLIZE_PLIST is a yes/no variable indicating whether to expand
###	*.la files in the PLIST into the corresponding real libraries.
###
### PREFIX is the installation prefix of the the package.
###
### TEST is the command used for shell tests, e.g. shell test built-in or
###	the path to a "test" binary.
###

BEGIN {
	LIBTOOL_EXPAND = ENVIRON["LIBTOOL_EXPAND"]
	LIBTOOLIZE_PLIST = ENVIRON["LIBTOOLIZE_PLIST"]
	PREFIX = ENVIRON["PREFIX"]
	TEST = ENVIRON["TEST"]
}

###
### Expand libtool archives into the list of corresponding shared and/or
### static libraries.
###
(LIBTOOLIZE_PLIST ~ /[yY][eE][sS]/) && /^[^@].*\.la$/ {
	print_entry($0)
	cmd = TEST " -f " PREFIX "/" $0
	if (system(cmd) == 0) {
		cmd = "cd " PREFIX " && " LIBTOOL_EXPAND " " $0
		while (cmd | getline) {
			print_entry($0)
		}
		close(cmd)
	}
	next
}
