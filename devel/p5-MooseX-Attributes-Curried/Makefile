# $NetBSD: Makefile,v 1.5 2012/10/03 21:55:18 wiz Exp $
#

DISTNAME=	MooseX-Attributes-Curried-0.03
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	4
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=MooseX/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/MooseX-Attributes-Curried/
COMMENT=	Perl 5 module to define curried versions of "has" in Moose
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	# empty
PERL5_PACKLIST=	auto/MooseX/Attributes/Curried/.packlist

DEPENDS+=	p5-Moose>=0.84:../../devel/p5-Moose
DEPENDS+=	p5-Sub-Exporter>=0.01:../../devel/p5-Sub-Exporter

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
