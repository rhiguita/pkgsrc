$NetBSD$

--- ./avidemux/ADM_userInterfaces/ADM_render/GUI_sdlRender.cpp.orig	2010-09-12 19:22:15.000000000 +0000
+++ ./avidemux/ADM_userInterfaces/ADM_render/GUI_sdlRender.cpp
@@ -29,8 +29,8 @@ extern "C" {
 #undef HAVE_MALLOC_H
 #undef HAVE_STDINT_H
 #undef HAVE_SYS_TYPES_H
-#include "SDL.h"
-#include "SDL_syswm.h"
+#include <SDL/SDL.h>
+#include <SDL/SDL_syswm.h>
 }
 
 #include "ADM_colorspace.h"
