# $NetBSD: Makefile,v 1.16 2012/10/03 21:55:17 wiz Exp $
#

DISTNAME=	Module-Pluggable-4.3
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
SVR4_PKGNAME=	p5mpl
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Module/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Module-Pluggable/
COMMENT=	Perl 5 module for automatically adding the ability to have plugins to modules
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Module/Pluggable/.packlist
PERL5_MODULE_TYPE=	Module::Build

post-extract:
	 ${FIND} ${WRKSRC} -type f -name "*.pm" -print | ${XARGS} ${CHMOD} -x

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
