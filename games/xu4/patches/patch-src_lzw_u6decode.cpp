$NetBSD$

Add missing header.

--- src/lzw/u6decode.cpp.orig	2005-10-03 06:30:09.000000000 +0000
+++ src/lzw/u6decode.cpp
@@ -28,6 +28,7 @@
  */
 
 #include <stdio.h>
+#include <stdlib.h>
 
 #include "u6decode.h"
 #include "u6stack.h"
