# $NetBSD: Makefile,v 1.34 2012/12/16 01:52:24 obache Exp $

DISTNAME=	kdeadmin-${_KDE_VERSION}
PKGNAME=	${DISTNAME:S/-4/4-4/}
PKGREVISION=	8
CATEGORIES=	misc
COMMENT=	System administration tools for the KDE integrated X11 desktop

.include "../../meta-pkgs/kde4/Makefile.kde4"

# BUILD_MAKE_FLAGS+= VERBOSE=1

REPLACE_PERL+=	knetworkconf/backends/network-conf.cmake
REPLACE_PERL+=	knetworkconf/backends/*.pl.cmake

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../misc/kdepimlibs4/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kdelibs4/buildlink3.mk"
.include "../../x11/kde-runtime4/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
