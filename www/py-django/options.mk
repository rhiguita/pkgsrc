# $NetBSD: options.mk,v 1.5 2008/04/12 22:43:13 jlam Exp $

PKG_OPTIONS_VAR =	PKG_OPTIONS.django
PKG_SUPPORTED_OPTIONS=	mysql postgresql sqlite
PKG_SUGGESTED_OPTIONS=	postgresql

.include "../../mk/bsd.options.mk"

PLIST_VARS+=	${PKG_SUPPORTED_OPTIONS}

.if !empty(PKG_OPTIONS:Mmysql)
DEPENDS+=	${PYPKGPREFIX}-mysqldb-[0-9]*:../../databases/py-mysqldb
PLIST.mysql=	yes
.endif

.if !empty(PKG_OPTIONS:Mpostgresql)
DEPENDS+=	${PYPKGPREFIX}-psycopg2-[0-9]*:../../databases/py-psycopg2
PLIST.postgresql=	yes
.endif

.if !empty(PKG_OPTIONS:Msqlite)
DEPENDS+=	${PYPKGPREFIX}-sqlite2-[0-9]*:../../databases/py-sqlite2
PLIST.sqlite=	yes
.endif
