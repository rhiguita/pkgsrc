$NetBSD$

--- xpointer.c.orig	2010-10-12 06:25:33.000000000 +0000
+++ xpointer.c
@@ -1269,6 +1269,7 @@ xmlXPtrEvalXPointer(xmlXPathParserContex
 	ctxt->valueNr = 0;
 	ctxt->valueMax = 10;
 	ctxt->value = NULL;
+	ctxt->valueFrame = 0;
     }
     SKIP_BLANKS;
     if (CUR == '/') {
