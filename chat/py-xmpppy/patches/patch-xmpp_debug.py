$NetBSD$

disable debugging in the library

--- xmpp/debug.py.orig	2006-03-25 00:11:17.000000000 -0600
+++ xmpp/debug.py
@@ -420,4 +420,4 @@ class Debug:      
 DBG_ALWAYS='always'
 
 ##Uncomment this to effectively disable all debugging and all debugging overhead.
-#Debug=NoDebug
+Debug=NoDebug
