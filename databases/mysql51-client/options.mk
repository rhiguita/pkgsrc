# $NetBSD: options.mk,v 1.4 2011/03/17 13:26:04 adam Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.mysql5

PKG_SUPPORTED_OPTIONS+=	embedded-server mysqlmanager ndb-cluster pstack ssl
PKG_SUGGESTED_OPTIONS+=	embedded-server mysqlmanager ndb-cluster pstack ssl

.include "../../mk/bsd.options.mk"

###
### Enable OpenSSL support
###
.if !empty(PKG_OPTIONS:Mssl)
.	include "../../security/openssl/buildlink3.mk"
CONFIGURE_ARGS+=	--with-ssl=${BUILDLINK_PREFIX.openssl}
.else
CONFIGURE_ARGS+=	--without-ssl
.endif
