# $NetBSD: buildlink3.mk,v 1.11 2007/01/07 12:25:05 wiz Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
FLAC_BUILDLINK3_MK:=	${FLAC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	flac
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nflac}
BUILDLINK_PACKAGES+=	flac
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}flac

.if !empty(FLAC_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.flac+=	flac>=1.1.0nb1
BUILDLINK_ABI_DEPENDS.flac+=	flac>=1.1.3nb1
BUILDLINK_PKGSRCDIR.flac?=	../../audio/flac
.endif	# FLAC_BUILDLINK3_MK

.include "../../multimedia/libogg/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
