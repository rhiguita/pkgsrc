# $NetBSD$
#
# This Makefile fragment is included by bsd.pkg.mk and provides all
# variables and targets related to building sources for a package.
#
# The following are the "public" targets provided by this module:
#
#    build, test
#
# The following targets may be overridden in a package Makefile:
#
#    pre-build, do-build, post-build
#    pre-test,  do-test,  post-test
#

_BUILD_COOKIE=	${WRKDIR}/.build_done
_TEST_COOKIE=	${WRKDIR}/.test_done

######################################################################
### build (PUBLIC)
######################################################################
### build is a public target to build the sources for the package.
###
.PHONY: build
.if defined(NO_BUILD)
.  if !target(build)
build: configure build-cookie
.  endif
.else
.  include "${PKGSRCDIR}/mk/build/build.mk"
.endif

.include "${PKGSRCDIR}/mk/build/test.mk"

######################################################################
### build-cookie (PRIVATE)
######################################################################
### build-cookie creates the "build" cookie file.
###
.PHONY: build-cookie
build-cookie:
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} ${_BUILD_COOKIE:H}
	${_PKG_SILENT}${_PKG_DEBUG}${ECHO} ${PKGNAME} >> ${_BUILD_COOKIE}
