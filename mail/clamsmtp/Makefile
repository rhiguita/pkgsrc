# $NetBSD: Makefile,v 1.42 2010/09/28 13:21:31 wiz Exp $

DISTNAME=		clamsmtp-1.10
#PKGREVISION=		1
CATEGORIES=		mail
MASTER_SITES=		http://memberwebs.com/stef/software/clamsmtp/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://memberwebs.com/stef/software/clamsmtp/
COMMENT=		SMTP filter that allows you to check for viruses
LICENSE=		modified-bsd

PKG_INSTALLATION_TYPES=	overwrite pkgviews

GNU_CONFIGURE=		yes
RCD_SCRIPTS=		clamsmtpd

MESSAGE_SUBST+=		HOMEPAGE=${HOMEPAGE:Q}
FILES_SUBST+=		CLAMAV_USER=${CLAMAV_USER}

# Doesn't work with GNU pth (missing required mutex features)
PTHREAD_OPTS+=		require native

EGDIR=			${PREFIX}/share/examples/${PKGBASE}
CONF_FILES=		${EGDIR}/clamsmtpd.conf \
			${PKG_SYSCONFDIR}/clamsmtpd.conf

INSTALLATION_DIRS=	share/examples/${PKGBASE}

PKG_USERS_VARS=		CLAMAV_USER

post-install:
	${INSTALL_DATA} ${WRKSRC}/doc/clamsmtpd.conf ${DESTDIR}${EGDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/virus_action.sh ${DESTDIR}${EGDIR}

.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
