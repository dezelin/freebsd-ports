--- ./cmake/modules/FindKDE4Internal.cmake.orig	2013-03-01 07:26:13.335789000 +0100
+++ ./cmake/modules/FindKDE4Internal.cmake	2013-03-29 21:51:00.038340976 +0100
@@ -716,7 +716,7 @@
 #####################  provide some options   ##########################################
 
 option(KDE4_ENABLE_FINAL "Enable final all-in-one compilation")
-option(KDE4_BUILD_TESTS  "Build the tests" ON)
+option(KDE4_BUILD_TESTS  "Build the tests")
 option(KDE4_ENABLE_HTMLHANDBOOK  "Create targets htmlhandbook for creating the html versions of the docbook docs")
 set(KDE4_SERIALIZE_TOOL "" CACHE STRING "Tool to serialize resource-intensive commands in parallel builds")
 
@@ -893,8 +893,8 @@
    _set_fancy(XDG_MIME_INSTALL_DIR     "${SHARE_INSTALL_PREFIX}/mime/packages"  "The install dir for the xdg mimetypes")
 
    _set_fancy(SYSCONF_INSTALL_DIR      "${CMAKE_INSTALL_PREFIX}/etc"            "The sysconfig install dir (default ${CMAKE_INSTALL_PREFIX}/etc)")
-   _set_fancy(MAN_INSTALL_DIR          "${SHARE_INSTALL_PREFIX}/man"            "The man install dir (default ${SHARE_INSTALL_PREFIX}/man/)")
-   _set_fancy(INFO_INSTALL_DIR         "${SHARE_INSTALL_PREFIX}/info"           "The info install dir (default ${SHARE_INSTALL_PREFIX}/info)")
+   _set_fancy(MAN_INSTALL_DIR          "${CMAKE_INSTALL_PREFIX}/man"            "The man install dir (default ${SHARE_INSTALL_PREFIX}/man/)")
+   _set_fancy(INFO_INSTALL_DIR         "${CMAKE_INSTALL_PREFIX}/info"           "The info install dir (default ${SHARE_INSTALL_PREFIX}/info)")
    _set_fancy(DBUS_INTERFACES_INSTALL_DIR      "${SHARE_INSTALL_PREFIX}/dbus-1/interfaces" "The dbus interfaces install dir (default  ${SHARE_INSTALL_PREFIX}/dbus-1/interfaces)")
    _set_fancy(DBUS_SERVICES_INSTALL_DIR      "${SHARE_INSTALL_PREFIX}/dbus-1/services"     "The dbus services install dir (default  ${SHARE_INSTALL_PREFIX}/dbus-1/services)")
    _set_fancy(DBUS_SYSTEM_SERVICES_INSTALL_DIR      "${SHARE_INSTALL_PREFIX}/dbus-1/system-services"     "The dbus system services install dir (default  ${SHARE_INSTALL_PREFIX}/dbus-1/system-services)")
@@ -1204,7 +1204,7 @@
    set(CMAKE_C_FLAGS_DEBUGFULL        "-g3 -fno-inline")
    set(CMAKE_C_FLAGS_PROFILE          "-g3 -fno-inline -ftest-coverage -fprofile-arcs")
 
-   set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wno-long-long -std=iso9899:1990 -Wundef -Wcast-align -Werror-implicit-function-declaration -Wchar-subscripts -Wall -W -Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attribute -fno-common")
+   set(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS} -Wno-long-long -Wundef -Wcast-align -Werror-implicit-function-declaration -Wchar-subscripts -Wall -W -Wpointer-arith -Wwrite-strings -Wformat-security -Wmissing-format-attribute -fno-common")
    # As of Qt 4.6.x we need to override the new exception macros if we want compile with -fno-exceptions
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnon-virtual-dtor -Wno-long-long -Wundef -Wcast-align -Wchar-subscripts -Wall -W -Wpointer-arith -Wformat-security -fno-exceptions -DQT_NO_EXCEPTIONS -fno-check-new -fno-common")
 
