$NetBSD$

--- rtsp/rtsp_get_rtp_th.c.orig	2012-10-26 16:07:36.000000000 +0000
+++ rtsp/rtsp_get_rtp_th.c
@@ -28,7 +28,7 @@
 
 #include <nemesi/rtsp.h>
 
-inline rtp_thread *rtsp_get_rtp_th(rtsp_ctrl * rtsp_ctl)
+rtp_thread *rtsp_get_rtp_th(rtsp_ctrl * rtsp_ctl)
 {
 	return ((rtsp_thread *) rtsp_ctl)->rtp_th;
 }
