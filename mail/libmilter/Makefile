# $NetBSD: Makefile,v 1.18 2010/01/16 11:33:12 tron Exp $

PKGNAME=	libmilter-${DIST_VERS}
COMMENT=	Mail filter support library for sendmail

.include "options.mk"
.include "../../mail/sendmail/Makefile.common"

INSTALLATION_DIRS=	include lib

post-patch: make-sendmail-siteconfig

do-build:
	(cd ${WRKSRC}/libmilter && env ${MAKE_ENV} ./Build)

do-install:
	(cd ${WRKSRC}/libmilter && env ${MAKE_ENV} ./Build BINOWN=${BINOWN} BINGRP=${BINGRP} SHAREOWN=${SHAREOWN} SHAREGRP=${SHAREGRP} INCLUDEDIR=${DESTDIR}${PREFIX}/include LIBDIR=${DESTDIR}${PREFIX}/lib install)

PTHREAD_OPTS+=	require

.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"

# has to be below include for bsd.pkg.mk, else substition fails
OBJDIR!=	${ECHO} obj.`${UNAME} -srm | ${TR} \  .`
