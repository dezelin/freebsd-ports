--- cpp.orig/src/Ice/Object.cpp	2011-06-15 21:43:58.000000000 +0200
+++ cpp/src/Ice/Object.cpp	2012-03-04 20:14:52.000000000 +0100
@@ -19,7 +19,7 @@
 using namespace Ice;
 using namespace IceInternal;
 
-IceUtil::Shared* IceInternal::upCast(Object* p) { return p; }
+IceUtil::Shared* Ice::upCast(Object* p) { return p; }
 
 bool
 Ice::Object::operator==(const Object& r) const
