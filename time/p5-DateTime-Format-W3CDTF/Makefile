# $NetBSD: Makefile,v 1.8 2012/10/03 21:58:20 wiz Exp $

DISTNAME=	DateTime-Format-W3CDTF-0.06
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	time perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=DateTime/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/DateTime-Format-W3CDTF/
COMMENT=	Convert between DateTime and W3CDTF date/time format

DEPENDS+=	p5-DateTime-[0-9]*:../../time/p5-DateTime

PERL5_PACKLIST= auto/DateTime/Format/W3CDTF/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
