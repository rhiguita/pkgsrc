# $NetBSD: Makefile,v 1.2 2012/10/03 21:58:57 wiz Exp $

DISTNAME=	Plack-Test-ExternalServer-0.01
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Plack/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://search.cpan.org/dist/Plack-Test-ExternalServer/
COMMENT=	Run HTTP tests on external live servers
LICENSE=	${PERL5_LICENSE}

USE_LANGUAGES=	# empty
PERL5_PACKLIST= auto/Plack/Test/ExternalServer/.packlist

DEPENDS+=	p5-URI>=0:../../www/p5-URI
DEPENDS+=	p5-libwww>0:../../www/p5-libwww
DEPENDS+=	p5-Plack>=0.9913:../../www/p5-Plack
DEPENDS+=	p5-Test-TCP>0:../../net/p5-Test-TCP
DEPENDS+=	p5-HTTP-Message>=0:../../www/p5-HTTP-Message

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
