# $NetBSD: Makefile,v 1.13 2012/10/23 10:24:10 wiz Exp $

DISTNAME=	wmnet-1.2
PKGNAME=	wminet-1.2
PKGREVISION=	1
CATEGORIES=	net x11
MASTER_SITES=	ftp://ftp.enteract.com/users/rneswold/

MAINTAINER=	coto@core.de
HOMEPAGE=	http://users.rcn.com/rneswold/
COMMENT=	Dockable network monitor

NOT_FOR_PLATFORM=	Interix-*-* # no userland protocol stack support

USE_X11BASE=	YES

INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wminet ${DESTDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/wmnet.1 ${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/wminet.1

.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXpm/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
