# $NetBSD: Makefile,v 1.1.1.1 2011/05/28 08:36:05 cheusov Exp $

PKGNAME=	heirloom-su-${HEIRLOOM_VER}
CATEGORIES=	textproc

MAKE_FLAGS+=	SUBDIRS="build su"

NEED_LIBCRYPT=	1

.include "../../sysutils/heirloom-doc/Makefile.common"

DESCR_SRC+=	${.CURDIR}/DESCR

.include "../../devel/heirloom-libcommon/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
