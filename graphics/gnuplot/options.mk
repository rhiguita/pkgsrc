# $NetBSD: options.mk,v 1.5 2012/08/10 15:14:54 drochner Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.gnuplot
PKG_SUPPORTED_OPTIONS=	gd lua pdf x11 qt4
.if ${OPSYS} != "NetBSD"
# wxterminal is broken on NetBSD c.f. pkg/47177
PKG_SUPPORTED_OPTIONS+=	wxwidgets
.endif
PKG_SUGGESTED_OPTIONS=	gd x11

.include "../../mk/bsd.options.mk"

PLIST_VARS+=	x11 qt4

.if !empty(PKG_OPTIONS:Mgd)
.include "../../graphics/gd/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mlua)
.include "../../lang/lua/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-lua
.endif

# PDF output is also provided by cairo
.if !empty(PKG_OPTIONS:Mpdf)
CONFIGURE_ARGS+=	--with-pdf
.include "../../print/pdflib-lite/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mx11)
PLIST.x11=	yes
.include "../../x11/libXaw/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-x
.endif

.if !empty(PKG_OPTIONS:Mqt4)
USE_LANGUAGES+=	c++
CONFIGURE_ARGS+=	--enable-qt
PLIST.qt4=      yes
.include "../../x11/qt4-libs/buildlink3.mk"
.else
CONFIGURE_ARGS+=        --disable-qt
.endif

.if !empty(PKG_OPTIONS:Mwxwidgets)
USE_LANGUAGES+= c++
CONFIGURE_ARGS+=        --enable-wxwidgets
.include "../../x11/wxGTK28/buildlink3.mk"
.else
CONFIGURE_ARGS+=        --disable-wxwidgets
.endif
