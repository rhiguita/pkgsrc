# $NetBSD$

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GSNMP_BUILDLINK3_MK:=	${GSNMP_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	gsnmp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngsnmp}
BUILDLINK_PACKAGES+=	gsnmp
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}gsnmp

.if ${GSNMP_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.gsnmp+=	gsnmp>=0.2.0
BUILDLINK_PKGSRCDIR.gsnmp?=	../../net/gsnmp
.endif	# GSNMP_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
