# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SILGRAPHITE_BUILDLINK3_MK:=	${SILGRAPHITE_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	silgraphite
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsilgraphite}
BUILDLINK_PACKAGES+=	silgraphite
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}silgraphite

.if ${SILGRAPHITE_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.silgraphite+=	silgraphite>=2.3
BUILDLINK_PKGSRCDIR.silgraphite?=	../../graphics/silgraphite
.endif	# SILGRAPHITE_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
