#!@BUILDLINK_SHELL@
#
# $NetBSD: wrapper.sh,v 1.3 2002/09/23 01:11:39 jlam Exp $

Xsed='@SED@ -e 1s/^X//'
sed_quote_subst='s/\([\\`\\"$\\\\]\)/\\\1/g'

pre_cache="@_BLNK_WRAP_PRE_CACHE@"
cache="@_BLNK_WRAP_CACHE@"
post_cache="@_BLNK_WRAP_POST_CACHE@"
logic="@_BLNK_WRAP_LOGIC@"
specificlogic="@_BLNK_WRAP_SPECIFIC_LOGIC@"
wrapperlog="@_BLNK_WRAP_LOG@"
updatecache=${BUILDLINK_UPDATE_CACHE-yes}

cmd="@WRAPPEE@"
for arg; do
	cacheupdated=no
	. $logic
	case "$cacheupdated" in
	yes) @CAT@ $pre_cache $cache $post_cache > $logic ;;
	esac
	. $specificlogic
	args="$args $arg"
done
cmd="$cmd $args"

@_BLNK_WRAP_ENV@
@_BLNK_WRAP_SANITIZE_PATH@

@ECHO@ $cmd >> $wrapperlog
eval exec $cmd
