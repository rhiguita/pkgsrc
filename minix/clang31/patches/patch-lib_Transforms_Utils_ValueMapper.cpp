$NetBSD$

--- lib/Transforms/Utils/ValueMapper.cpp.orig	Tue Dec 13 03:20:07 2011
+++ lib/Transforms/Utils/ValueMapper.cpp
@@ -63,14 +63,29 @@ Value *llvm::MapValue(const Value *V, ValueToValueMapT
     // Check all operands to see if any need to be remapped.
     for (unsigned i = 0, e = MD->getNumOperands(); i != e; ++i) {
       Value *OP = MD->getOperand(i);
-      if (OP == 0 || MapValue(OP, VM, Flags, TypeMapper) == OP) continue;
+      if (OP == 0) continue;
+      Value *Mapped_OP = MapValue(OP, VM, Flags, TypeMapper);
+      // Use identity map if Mapped_Op is null and we can ignore missing
+      // entries.
+      if (Mapped_OP == OP ||
+          (Mapped_OP == 0 && (Flags & RF_IgnoreMissingEntries)))
+        continue;
 
       // Ok, at least one operand needs remapping.  
       SmallVector<Value*, 4> Elts;
       Elts.reserve(MD->getNumOperands());
       for (i = 0; i != e; ++i) {
         Value *Op = MD->getOperand(i);
-        Elts.push_back(Op ? MapValue(Op, VM, Flags, TypeMapper) : 0);
+	if (Op == 0)
+	  Elts.push_back(0);
+	else {
+	  Value *Mapped_Op = MapValue(Op, VM, Flags, TypeMapper);
+	  // Use identity map if Mapped_Op is null and we can ignore missing
+	  // entries.
+	  if (Mapped_Op == 0 && (Flags & RF_IgnoreMissingEntries))
+	    Mapped_Op = Op;
+	  Elts.push_back(Mapped_Op);
+	}
       }
       MDNode *NewMD = MDNode::get(V->getContext(), Elts);
       Dummy->replaceAllUsesWith(NewMD);
