# $NetBSD: Makefile,v 1.13 2012/10/28 06:31:04 asau Exp $
#

DISTNAME=	serf-0.3.0
PKGREVISION=	4
CATEGORIES=	www
MASTER_SITES=	http://serf.googlecode.com/files/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://code.google.com/p/serf/
COMMENT=	High-performance asynchronous HTTP client library

PKG_INSTALLATION_TYPES=	overwrite pkgviews

GNU_CONFIGURE=		yes
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake

TEST_TARGET=		check

.include "../../devel/apr/buildlink3.mk"
.include "../../devel/apr-util/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
