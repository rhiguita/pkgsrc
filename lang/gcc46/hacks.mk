# $NetBSD$

#
# Avoid -fkeep-inline-functions with NetBSD/arm
#
.if ${OPSYS} == "NetBSD" && ${MACHINE_ARCH} == "arm"
PKG_HACKS+=		netbsd-arm-stage1-fix
USE_LANGUAGES+=		c c++
CONFIGURE_ARGS+=	--enable-build-with-cxx
.endif
