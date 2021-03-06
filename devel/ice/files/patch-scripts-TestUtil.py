--- scripts.orig/TestUtil.py	2011-06-15 21:44:00.000000000 +0200
+++ scripts/TestUtil.py	2012-03-04 20:14:53.000000000 +0100
@@ -74,6 +74,25 @@
 def isLinux():
     return sys.platform.startswith("linux")
 
+def isFreeBSD():
+    return sys.platform.startswith("freebsd")
+
+def sysctl(key):
+    p = subprocess.Popen("sysctl "+key, shell=1, stdout=subprocess.PIPE)
+    try:
+        result = p.communicate()[0].strip().split()[1]
+    except IndexError:
+        return 0    
+    if sys.version_info >= (3,):
+        result = str(result, sys.stdout.encoding)
+    try:
+        return int(result)
+    except ValueError:
+        return result
+
+def isFreeBSDJail():
+    return isFreeBSD() and sysctl("security.jail.jailed")
+
 def getCppCompiler():
     compiler = ""
     if os.environ.get("CPP_COMPILER", "") != "":
@@ -1590,7 +1609,15 @@
             if isDarwin() and "nodarwin" in config:
                 print "%s*** test not supported under Darwin%s" % (prefix, suffix)
                 continue
+
+            if isFreeBSD() and "nofreebsd" in config:
+                print "%s*** test not supported under FreeBSD%s" % (prefix, suffix)
+                continue
             
+            if isFreeBSDJail() and "nofreebsdjail" in config:
+                print "%s*** test not supported within a FreeBSD Jail%s" % (prefix, suffix)
+                continue
+
             if not isWin32() and "win32only" in config:
                 print "%s*** test only supported under Win32%s" % (prefix, suffix)
                 continue
