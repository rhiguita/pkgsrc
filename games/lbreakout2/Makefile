# $NetBSD: Makefile,v 1.37 2012/10/06 11:54:45 asau Exp $

DISTNAME=	lbreakout2-2.6.4
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=lgames/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://lgames.sourceforge.net/
COMMENT=	Breakout-style arcade game
LICENSE=	gnu-gpl-v2

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--localstatedir=${VARBASE:Q}/games
CONFIGURE_ARGS+=	--with-highscore-path=${PREFIX}/share/games/
CONFIGURE_ARGS+=	--with-docdir=${PREFIX}/share/doc/html

LDFLAGS.SunOS+=	-lsocket -lnsl

.include "../../mk/compiler.mk"
.if !empty(PKGSRC_COMPILER:Msunpro)
SUBST_CLASSES+=		sunpro
SUBST_STAGE.sunpro=	pre-configure
SUBST_MESSAGE.sunpro=	Removing "inline" for SunPro.
SUBST_FILES.sunpro=	common/tools.h common/tools.c
SUBST_SED.sunpro=	-e 's,^inline ,,'
.endif

CONF_FILES_PERMS+=	/dev/null ${VARBASE}/games/lbreakout2.hscr \
			${REAL_ROOT_USER} games 664

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../audio/SDL_mixer/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
