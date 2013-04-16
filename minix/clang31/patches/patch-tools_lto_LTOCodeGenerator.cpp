$NetBSD$

--- tools/lto/LTOCodeGenerator.cpp.orig	Tue Dec 13 03:20:06 2011
+++ tools/lto/LTOCodeGenerator.cpp
@@ -54,6 +54,9 @@
 
 using namespace llvm;
 
+static cl::opt<bool> DisableOpt("disable-opt", cl::init(false),
+  cl::desc("Do not run the optimization pass"));
+
 static cl::opt<bool> DisableInline("disable-inlining",
   cl::desc("Do not run the inliner pass"));
 
@@ -380,9 +383,11 @@ bool LTOCodeGenerator::generateObjectFile(raw_ostream 
 
     // Add an appropriate TargetData instance for this module...
     passes.add(new TargetData(*_target->getTargetData()));
-    
-    PassManagerBuilder().populateLTOPassManager(passes, /*Internalize=*/ false,
-                                                !DisableInline);
+   
+    if (!DisableOpt) {
+        PassManagerBuilder().populateLTOPassManager(passes, /*Internalize=*/ false,
+                                                    !DisableInline);
+    }
 
     // Make sure everything is still good.
     passes.add(createVerifierPass());
