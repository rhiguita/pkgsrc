# $NetBSD: Makefile,v 1.3 2010/11/08 16:24:58 minskim Exp $

DISTNAME=	hyphen-dutch
PKGNAME=	tex-${DISTNAME}-2010
PKGREVISION=	1
TEXLIVE_REV=	20144

MAINTAINER=	minskim@NetBSD.org
COMMENT=	Hyphenation patterns for Dutch

CONFLICTS+=	teTeX-texmf<=3.0nb12
DEPENDS+=	tex-hyph-utf8-[0-9]*:../../print/tex-hyph-utf8

TEX_HYPHEN_DAT+=	dutch loadhyph-nl.tex
TEX_HYPHEN_DEF+=	\addlanguage{dutch}{loadhyph-nl.tex}{}{2}{2}
TEX_HYPHEN_LUA+=	['dutch']={ \
			  loader='loadhyph-nl.tex', \
			  lefthyphenmin=2, \
			  righthyphenmin=2, \
			  synonyms={}, \
			  patterns='hyph-nl.pat.txt', \
			  hyphenation='hyph-nl.hyp.txt', \
			},

.include "../../print/texlive/package.mk"
.include "../../mk/bsd.pkg.mk"
