--- cpp.orig/include/Ice/IncomingAsyncF.h	2011-06-15 21:43:58.000000000 +0200
+++ cpp/include/Ice/IncomingAsyncF.h	2012-03-04 20:14:52.000000000 +0100
@@ -28,12 +28,6 @@
 
 class AMD_Object_ice_invoke;
 class AMD_Array_Object_ice_invoke;
-
-}
-
-namespace IceInternal
-{
-
 ICE_API IceUtil::Shared* upCast(::Ice::AMD_Object_ice_invoke*);
 ICE_API IceUtil::Shared* upCast(::Ice::AMD_Array_Object_ice_invoke*);
 
