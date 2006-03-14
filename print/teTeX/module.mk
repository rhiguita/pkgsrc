# $NetBSD: module.mk,v 1.11 2006/01/13 17:56:43 wiz Exp $
#
# This Makefile fragment is intended to be included by packages that
# install TeX packages.  It takes care of rebuilding the ls-R database
# at (de)installation time.
#
# The following variables can be defined:
#
#    TEXMFDIRS - A list of TEXMF directories that need to update ls-R.
#                Default: ${PKG_LOCALTEXMFPREFIX}
#
#    TEX_FONTMAPS - A list of font map files
#

.if !defined(TEX_PACKAGE_MK)
TEX_PACKAGE_MK=		# defined

TEXMFDIRS?=		${PKG_LOCALTEXMFPREFIX}
TEX_FONTMAPS?=		# empty

.if !empty(TEX_FONTMAPS)
BUILDLINK_DEPENDS.teTeX-bin+=	teTeX-bin>=3.0nb4
.endif

FILES_SUBST+=		MKTEXLSR="${LOCALBASE}/bin/mktexlsr"
FILES_SUBST+=		TEXMFDIRS=${TEXMFDIRS:Q}
FILES_SUBST+=		UPDMAP_SYS="${LOCALBASE}/bin/updmap-sys"
FILES_SUBST+=		TEX_FONTMAPS=${TEX_FONTMAPS:Q}
INSTALL_TEMPLATE+=	../../print/teTeX/files/texmf.tmpl
DEINSTALL_TEMPLATE+=	../../print/teTeX/files/texmf.tmpl

PRINT_PLIST_AWK+=	/^(@dirrm )?${PKG_LOCALTEXMFPREFIX:S|${PREFIX}/||:S|/|\\/|g}(\/ls-R)?$$/ \
			{ next; }

# do not use tex.buildlink3.mk when the only accepted version is teTeX1 or teTeX2, to
# allow bulk build to create packages
.if defined(TEX_ACCEPTED) && ${TEX_ACCEPTED} == "teTeX1"
.include "../../print/teTeX1-bin/buildlink3.mk"
.elif defined(TEX_ACCEPTED) && ${TEX_ACCEPTED} == "teTeX2"
.include "../../print/teTeX-bin/buildlink3.mk"
.else
.include "../../mk/tex.buildlink3.mk"
.endif

.endif			# TEX_PACKAGE_MK
