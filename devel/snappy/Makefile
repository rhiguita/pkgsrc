# $NetBSD: Makefile,v 1.3 2012/03/14 18:15:27 abs Exp $

DISTNAME=	snappy-1.0.5
CATEGORIES=	devel
MASTER_SITES=	http://snappy.googlecode.com/files/

MAINTAINER=	agc@NetBSD.org
HOMEPAGE=	http://code.google.com/p/snappy/
COMMENT=	General purpose data compression library
LICENSE=	apache-2.0

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_LANGUAGES+=	c c++

.include "../../devel/zlib/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
