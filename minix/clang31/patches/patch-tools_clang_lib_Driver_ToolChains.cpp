$NetBSD$

--- tools/clang/lib/Driver/ToolChains.cpp.orig	Tue Dec 13 13:58:51 2011
+++ tools/clang/lib/Driver/ToolChains.cpp
@@ -1613,8 +1613,10 @@ Tool &NetBSD::SelectTool(const Compilation &C, const J
 
 Minix::Minix(const HostInfo &Host, const llvm::Triple& Triple)
   : Generic_ELF(Host, Triple) {
-  getFilePaths().push_back(getDriver().Dir + "/../lib");
-  getFilePaths().push_back("/usr/lib");
+
+  const Driver &D = getDriver();
+  getFilePaths().push_back(D.SysRoot + "/usr/lib");
+  getFilePaths().push_back(D.SysRoot + "/lib");
 }
 
 Tool &Minix::SelectTool(const Compilation &C, const JobAction &JA,
