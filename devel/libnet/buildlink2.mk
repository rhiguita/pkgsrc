# $NetBSD: buildlink2.mk,v 1.2 2002/08/25 18:38:32 jlam Exp $

.if !defined(LIBNET_BUILDLINK2_MK)
LIBNET_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		libnet
BUILDLINK_DEPENDS.libnet?=	libnet>=1.0.1bnb3
BUILDLINK_PKGSRCDIR.libnet?=	../../devel/libnet

EVAL_PREFIX+=			BUILDLINK_PREFIX.libnet=libnet
BUILDLINK_PREFIX.libnet_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.libnet=		include/libnet.h
BUILDLINK_FILES.libnet+=	include/libnet/*
BUILDLINK_FILES.libnet+=	lib/libnet.*

BUILDLINK_TARGETS+=	libnet-buildlink

libnet-buildlink: _BUILDLINK_USE

.endif	# LIBNET_BUILDLINK2_MK
