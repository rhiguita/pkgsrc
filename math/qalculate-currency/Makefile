# $NetBSD: Makefile,v 1.31 2012/10/02 17:11:32 tron Exp $

DISTNAME=	qalculate-currency-0.9.4
PKGREVISION=	17
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=qalculate/}

MAINTAINER=	adam@NetBSD.org
HOMEPAGE=	http://qalculate.sourceforge.net/
COMMENT=	Utility for conversion between currencies using Qalculate

USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes
USE_TOOLS+=		autoconf gmake intltool msgfmt pkg-config
GNU_CONFIGURE=		yes

pre-configure:
	${RUN} cd ${WRKSRC}; autoconf

.include "../../math/qalculate/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../mk/bsd.pkg.mk"
