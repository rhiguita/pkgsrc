# $NetBSD: Makefile,v 1.38 2012/10/03 21:57:31 wiz Exp $

DISTNAME=	Digest-MD5-2.52
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
SVR4_PKGNAME=	p5md5
CATEGORIES=	security perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Digest/}

MAINTAINER=	heinz@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Digest-MD5/
COMMENT=	Perl5 extension interface for MD5 algorithm
LICENSE=	${PERL5_LICENSE}

PKG_INSTALLATION_TYPES=	overwrite pkgviews

DEPENDS+=	{perl>=5.7.3,p5-Digest>=1.00}:../../security/p5-Digest

CONFLICTS+=	p5-MD5-[0-9]*

PERL5_PACKLIST=		auto/Digest/MD5/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
