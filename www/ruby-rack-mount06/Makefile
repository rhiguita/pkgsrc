# $NetBSD: Makefile,v 1.1.1.1 2011/12/14 16:32:06 taca Exp $

DISTNAME=	rack-mount-0.6.14
PKGREVISION=	1
CATEGORIES=	www

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://github.com/josh/rack-mount
COMMENT=	Stackable dynamic tree based Rack router
LICENSE=	mit

# This package is for Ruby on Rails 3.0.x.
DEPENDS+=	${RUBY_PKGPREFIX}-rack>=1.0.0<1.3:../../www/ruby-rack12

.include "../../lang/ruby/gem.mk"
.include "../../mk/bsd.pkg.mk"
