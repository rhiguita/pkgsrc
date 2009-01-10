# $NetBSD: options.mk,v 1.2 2008/02/29 13:31:20 gdt Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.xmp
PKG_SUPPORTED_OPTIONS=	pulseaudio
PKG_SUGGESTED_OPTIONS=	pulseaudio

.include "../../mk/bsd.options.mk"

# Pulseaudio support
.if !empty(PKG_OPTIONS:Mpulseaudio)
CONFIGURE_ARGS+=--enable-pulseaudio
.  include "../../audio/pulseaudio/buildlink3.mk"
.else
CONFIGURE_ARGS+=--disable-pulseaudio
.endif
