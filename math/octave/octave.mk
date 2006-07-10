# $NetBSD: octave.mk,v 1.4 2005/12/05 20:50:36 rillig Exp $

.include "../../mk/bsd.prefs.mk"

OCTAVE_CONFIG=	${LOCALBASE}/bin/octave-config

# OCTAVE_VARS is a list of variables to define in the make environment.
# This may be overridden in an octave add-on package Makefile.
OCTAVE_VARS?=	LOCALVERFCNFILEDIR LOCALVEROCTFILEDIR LOCALVERARCHLIBDIR VERSION

# Set OCT_<var> to the value of <var> as returned by octave-config.
.if exists(${OCTAVE_CONFIG})
.  for _var_ in ${OCTAVE_VARS}
.    if !defined(OCT_${_var_})
OCT_${_var_}!=	${OCTAVE_CONFIG} -p ${_var_}
.    endif
.  endfor
.endif
