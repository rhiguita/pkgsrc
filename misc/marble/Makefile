# $NetBSD: Makefile,v 1.8 2012/10/08 23:01:05 adam Exp $

DISTNAME=	marble-${_KDE_VERSION}
PKGREVISION=	5
CATEGORIES=	misc
COMMENT=	KDE desktop globe

MAKE_JOBS_SAFE=	NO

.include "../../meta-pkgs/kde4/Makefile.kde4"

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kdelibs4/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
