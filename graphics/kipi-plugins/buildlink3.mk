# $NetBSD$

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
KIPI_PLUGINS_BUILDLINK3_MK:=	${KIPI_PLUGINS_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	kipi-plugins
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nkipi-plugins}
BUILDLINK_PACKAGES+=	kipi-plugins
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}kipi-plugins

.if ${KIPI_PLUGINS_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.kipi-plugins+=	kipi-plugins>=0.1.4nb6
BUILDLINK_PKGSRCDIR.kipi-plugins?=	../../graphics/kipi-plugins
.endif	# KIPI_PLUGINS_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
