# $NetBSD: buildlink3.mk,v 1.5 2011/04/17 21:45:26 ryoon Exp $

BUILDLINK_TREE+=	quvi

.if !defined(QUVI_BUILDLINK3_MK)
QUVI_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.quvi+=	quvi>=0.2.15
BUILDLINK_ABI_DEPENDS.quvi?=	quvi>=0.2.15nb1
BUILDLINK_PKGSRCDIR.quvi?=	../../net/quvi

.include "../../devel/pcre/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../lang/lua/buildlink3.mk"
.endif	# QUVI_BUILDLINK3_MK

BUILDLINK_TREE+=	-quvi
