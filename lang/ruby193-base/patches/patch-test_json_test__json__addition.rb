$NetBSD$

Fix for CVE-2013-0269.

--- test/json/test_json_addition.rb.orig	2011-09-01 00:25:52.000000000 +0000
+++ test/json/test_json_addition.rb
@@ -69,11 +69,19 @@ class TC_JSONAddition < Test::Unit::Test
     a = A.new(666)
     assert A.json_creatable?
     json = generate(a)
-    a_again = JSON.parse(json)
+    a_again = JSON.parse(json, :create_additions => true)
     assert_kind_of a.class, a_again
     assert_equal a, a_again
   end
 
+  def test_extended_json_default
+    a = A.new(666)
+    assert A.json_creatable?
+    json = generate(a)
+    a_hash = JSON.parse(json)
+    assert_kind_of Hash, a_hash
+  end
+
   def test_extended_json_disabled
     a = A.new(666)
     assert A.json_creatable?
@@ -100,7 +108,7 @@ class TC_JSONAddition < Test::Unit::Test
     c = C.new
     assert !C.json_creatable?
     json = generate(c)
-    assert_raises(ArgumentError, NameError) { JSON.parse(json) }
+    assert_raises(ArgumentError, NameError) { JSON.parse(json, :create_additions => true) }
   end
 
   def test_raw_strings
@@ -118,7 +126,7 @@ class TC_JSONAddition < Test::Unit::Test
     assert_match(/\A\{.*\}\Z/, json)
     assert_match(/"json_class":"String"/, json)
     assert_match(/"raw":\[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255\]/, json)
-    raw_again = JSON.parse(json)
+    raw_again = JSON.parse(json, :create_additions => true)
     assert_equal raw, raw_again
   end
 
@@ -126,17 +134,17 @@ class TC_JSONAddition < Test::Unit::Test
 
   def test_core
     t = Time.now
-    assert_equal t.inspect, JSON(JSON(t)).inspect
+    assert_equal t, JSON(JSON(t), :create_additions => true)
     d = Date.today
-    assert_equal d, JSON(JSON(d))
+    assert_equal d, JSON(JSON(d), :create_additions => true)
     d = DateTime.civil(2007, 6, 14, 14, 57, 10, Rational(1, 12), 2299161)
-    assert_equal d, JSON(JSON(d))
-    assert_equal 1..10, JSON(JSON(1..10))
-    assert_equal 1...10, JSON(JSON(1...10))
-    assert_equal "a".."c", JSON(JSON("a".."c"))
-    assert_equal "a"..."c", JSON(JSON("a"..."c"))
+    assert_equal d, JSON(JSON(d), :create_additions => true)
+    assert_equal 1..10, JSON(JSON(1..10), :create_additions => true)
+    assert_equal 1...10, JSON(JSON(1...10), :create_additions => true)
+    assert_equal "a".."c", JSON(JSON("a".."c"), :create_additions => true)
+    assert_equal "a"..."c", JSON(JSON("a"..."c"), :create_additions => true)
     s = MyJsonStruct.new 4711, 'foot'
-    assert_equal s, JSON(JSON(s))
+    assert_equal s, JSON(JSON(s), :create_additions => true)
     struct = Struct.new :foo, :bar
     s = struct.new 4711, 'foot'
     assert_raises(JSONError) { JSON(s) }
@@ -144,24 +152,24 @@ class TC_JSONAddition < Test::Unit::Test
       raise TypeError, "test me"
     rescue TypeError => e
       e_json = JSON.generate e
-      e_again = JSON e_json
+      e_again = JSON e_json, :create_additions => true
       assert_kind_of TypeError, e_again
       assert_equal e.message, e_again.message
       assert_equal e.backtrace, e_again.backtrace
     end
-    assert_equal(/foo/, JSON(JSON(/foo/)))
-    assert_equal(/foo/i, JSON(JSON(/foo/i)))
+    assert_equal(/foo/, JSON(JSON(/foo/), :create_additions => true))
+    assert_equal(/foo/i, JSON(JSON(/foo/i), :create_additions => true))
   end
 
   def test_utc_datetime
     now = Time.now
-    d = DateTime.parse(now.to_s)                    # usual case
-    assert_equal d, JSON.parse(d.to_json)
+    d = DateTime.parse(now.to_s, :create_additions => true)                    # usual case
+    assert_equal d, JSON.parse(d.to_json, :create_additions => true)
     d = DateTime.parse(now.utc.to_s)                # of = 0
-    assert_equal d, JSON.parse(d.to_json)
+    assert_equal d, JSON.parse(d.to_json, :create_additions => true)
     d = DateTime.civil(2008, 6, 17, 11, 48, 32, Rational(1,24))
-    assert_equal d, JSON.parse(d.to_json)
+    assert_equal d, JSON.parse(d.to_json, :create_additions => true)
     d = DateTime.civil(2008, 6, 17, 11, 48, 32, Rational(12,24))
-    assert_equal d, JSON.parse(d.to_json)
+    assert_equal d, JSON.parse(d.to_json, :create_additions => true)
   end
 end
