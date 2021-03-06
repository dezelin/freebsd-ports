# Created by: KIRIYAMA Kazuhiko<kiri@FreeBSD.org>
# $FreeBSD$

PORTNAME=	xemacs-devel-mule
PORTVERSION=	${XEMACS_VER:S/-/./}
PORTREVISION=	13
CATEGORIES+=	editors
MASTER_SITES=	${MASTER_SITE_XEMACS}
MASTER_SITE_SUBDIR=	xemacs-${XEMACS_REL}
.if defined(CANNA) && defined(FREEWNN)
PKGNAMESUFFIX+=	-canna+freewnn
.elif defined(CANNA) && defined(WNN6)
PKGNAMESUFFIX+=	-canna+wnn6
.elif defined(FREEWNN)
PKGNAMESUFFIX+=	-freewnn
.elif defined(WNN6)
PKGNAMESUFFIX+= -wnn6
.elif defined(CANNA)
PKGNAMESUFFIX+=	-canna
.endif
DISTNAME=	xemacs-${XEMACS_VER:S/-b/./}
DIST_SUBDIR=	xemacs

MAINTAINER=	ports@FreeBSD.org
COMMENT=	XEmacs(beta version) text editor with mule(Only the executables)

CONFLICTS=	emacs-19.* emacs-21.* emacs-22.* \
		xemacs-[0-9]* xemacs-devel-[0-9]* \
		xemacs-mule-[0-9]*

BUILD_DEPENDS=	${LOCALBASE}/lib/xemacs/mule-packages/pkginfo/MANIFEST.mule-base:${PORTSDIR}/editors/xemacs-mule-packages
RUN_DEPENDS=	${LOCALBASE}/lib/xemacs/mule-packages/pkginfo/MANIFEST.mule-base:${PORTSDIR}/editors/xemacs-mule-packages
.if defined(PKGNAMEPREFIX)
RUN_DEPENDS+=	${LOCALBASE}/lib/xemacs-${XEMACS_VER}/lisp/x-win-xfree86.elc:${PORTSDIR}/editors/xemacs-devel-mule
.endif
.if !defined(WITHOUT_X11)
BUILD_DEPENDS+=	fc-cache:${PORTSDIR}/x11-fonts/fontconfig
LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff \
		compface.1:${PORTSDIR}/mail/faces

USE_XORG+=	x11 xft xpm xbitmaps
CONFIGURE_ARGS=--with-xpm --with-xft=all
# XXX: needed until port updated to work nicely with autoconf >= 2.64
#      see files/patch-configure.ac for more details
CFLAGS+=	-I${LOCALBASE}/include/freetype2 -I${LOCALBASE}/include/libpng15
.endif

XEMACS_REL=	21.5
XEMACS_VER=	${XEMACS_REL}-b28
XEMACS_ARCH=	${MACHINE_ARCH}--freebsd

WRKSRC=		${WRKDIR}/xemacs-${XEMACS_VER:S/-b/./}
STRIP=
USE_AUTOTOOLS=	autoconf
CONFIGURE_TARGET=${XEMACS_ARCH}

CONFIGURE_ARGS+=	--enable-mule \
		--with-site-libraries='${SITE_LIBRARIES}' \
		--with-site-includes='${SITE_INCLUDES}' \
		--enable-sound=native \
		--with-site-lisp \
		--with-pop \
		--with-infopath=${LOCALBASE}/lib/xemacs/info:${LOCALBASE}/info:/usr/info:${LOCALBASE}/lib/texmf/doc/info:/usr/lib/texmf/doc:/usr/share/info \
		--enable-clash-detection \
		--enable-database=berkdb \
		${WITH_XIM} \
		${WITH_MENUBARS} ${WITH_SCROLLBARS} \
		${WITH_DIALOGS} ${WITH_WIDGETS}
MAKE_ARGS=	prefix=${PREFIX}
ALL_TARGET=	all dist
.if defined(PKGNAMEPREFIX)
INSTALL_TARGET=	install-arch-dep
PLIST=		${PKGDIR}/pkg-plist.arch-dep
.if ${PKGNAMEPREFIX} == "ja-"
DESCR=		${PKGDIR}/pkg-descr.ja
.endif
.else
MAN1=		ctags.1 etags.1 gnuattach.1 gnuclient.1 gnudoit.1 \
		gnuserv.1 xemacs.1
INFO=		xemacs-${XEMACS_VER}/beta \
		xemacs-${XEMACS_VER}/cl \
		xemacs-${XEMACS_VER}/custom \
		xemacs-${XEMACS_VER}/emodules \
		xemacs-${XEMACS_VER}/external-widget \
		xemacs-${XEMACS_VER}/info \
		xemacs-${XEMACS_VER}/internals \
		xemacs-${XEMACS_VER}/lispref \
		xemacs-${XEMACS_VER}/new-users-guide \
		xemacs-${XEMACS_VER}/standards \
		xemacs-${XEMACS_VER}/term \
		xemacs-${XEMACS_VER}/termcap \
		xemacs-${XEMACS_VER}/texinfo \
		xemacs-${XEMACS_VER}/widget \
		xemacs-${XEMACS_VER}/xemacs-faq \
		xemacs-${XEMACS_VER}/xemacs
.endif

# Debugging.
.if !defined(DEBUG)
CONFIGURE_ARGS+=--disable-debug --disable-error-checking
.endif
# Experimenal features.
.if !defined(WITH_EXPERIMENTAL)
CONFIGURE_ARGS+=--disable-kkcc --disable-mc-alloc --disable-newgc
.endif

.if defined(WITH_GTK)
CONFIGURE_ARGS+=--with-gtk
WITH_XIM=
WITH_MENUBARS=	--enable-menubars=gtk
WITH_SCROLLBARS=--enable-scrollbars=gtk
WITH_DIALOGS=	--enable-dialogs=gtk
WITH_WIDGETS=	--enable-widgets=gtk
USE_GNOME+=	gtk12
.endif

PKGDIR=		${.CURDIR}/../../editors/xemacs-devel-mule

PLIST_SUB=	XEMACS_VER=${XEMACS_VER} XEMACS_ARCH=${XEMACS_ARCH}

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 900000
BROKEN=		does not build on FreeBSD 9.X
.endif

pre-fetch:
.if defined(WITHOUT_X11)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "Set the environment variable WITHOUT_X11 if you "
	@${ECHO_MSG} "do not want to use X11."
CONFIGURE_ARGS+=	--with-x11=no
.else
.if !defined(WITH_GTK)
	@${ECHO_MSG} "If you want to use GTK, please set the environment variable WITH_GTK and recompile."
.endif
.if !defined(WITHOUT_MOTIF)
.if !defined(MOTIF_STATIC)
	@${ECHO_MSG} ""
	@${ECHO_MSG} "If your MOTIF library is actually lesstif, you might occasionally"
	@${ECHO_MSG} "experience locked-up frames."
	@${ECHO_MSG} "In this case, set the environment variable MOTIF_STATIC and recompile, "
	@${ECHO_MSG} "which will force the use of athena widgets for dialogs."
.endif
CONFIGURE_ARGS+=--with-jpeg=yes --with-png=yes --with-tiff=yes --with-xface=yes
USE_MOTIF=	yes

# hack to avoid shipping binaries linked with Motif
.if defined(MOTIF_STATIC)
WITH_DIALOGS?=	--enable-dialogs=athena
.else
WITH_DIALOGS?=	--enable-dialogs=motif
.endif

.if defined(PACKAGE_BUILDING)
CONFIGURE_ARGS+=--with-offix=no
.endif
WITH_MENUBARS?=	--enable-menubars=lucid
WITH_SCROLLBARS?=--enable-scrollbars=motif
WITH_WIDGETS?=	--enable-widgets=motif
.endif
WITH_XIM?=	--with-xim=xlib
WITH_MENUBARS?=	--enable-menubars=athena
WITH_SCROLLBARS?=--enable-scrollbars=athena
WITH_DIALOGS?=	--enable-dialogs=athena
WITH_WIDGETS?=	--enable-widgets=athena

.if defined(WITH_XAW3D)
LIB_DEPENDS+=	Xaw3d:${PORTSDIR}/x11-toolkits/Xaw3d
CONFIGURE_ARGS+=--with-athena=3d
.else
CONFIGURE_ARGS+=--with-athena=xaw
.endif

.endif

.if exists(${LOCALBASE}/include/libpq-fe.h)
WITH_PGSQL=	yes
.endif
.if defined(WITH_PGSQL)
USE_PGSQL=	yes
PLIST_SUB+=	WITH_PGSQL=""
.else
PLIST_SUB+=	WITH_PGSQL="@comment "
.endif

.if exists(${LOCALBASE}/include/ldap.h)
WITH_LDAP=	yes
.endif
.if defined(WITH_LDAP)
USE_OPENLDAP=	yes
PLIST_SUB+=	WITH_LDAP=""
.else
PLIST_SUB+=	WITH_LDAP="@comment "
.endif

BINNAMEEXT=		-mule
.if defined(CANNA) && defined(FREEWNN)
CONFIGURE_ARGS+=	--with-canna --with-wnn --with-wnn6=no
LIB_DEPENDS+=		canna.1:${PORTSDIR}/japanese/canna-lib \
			wnn.0:${PORTSDIR}/japanese/FreeWnn-lib
.elif defined(CANNA) && defined(WNN6)
SITE_INCLUDES=		${LOCALBASE}/include/wnn6
CONFIGURE_ARGS+=	--with-canna --with-wnn6
LIB_DEPENDS+=		canna.1:${PORTSDIR}/japanese/canna-lib \
			wnn6.2:${PORTSDIR}/japanese/Wnn6-lib
.elif defined(FREEWNN)
CONFIGURE_ARGS+=	--with-wnn --with-canna=no --with-wnn6=no
LIB_DEPENDS+=		wnn.0:${PORTSDIR}/japanese/FreeWnn-lib
.elif defined(WNN6)
SITE_INCLUDES=		${LOCALBASE}/include/wnn6
CONFIGURE_ARGS+=	--with-wnn6 --with-canna=no
LIB_DEPENDS+=		wnn6.2:${PORTSDIR}/japanese/Wnn6-lib
.elif defined(CANNA)
CONFIGURE_ARGS+=	--with-canna --with-wnn=no --with-wnn6=no
LIB_DEPENDS+=		canna.1:${PORTSDIR}/japanese/canna-lib
.else
CONFIGURE_ARGS+=	--with-canna=no --with-wnn=no --with-wnn6=no
.endif

.if defined(CANNA)
PLIST_SUB+=		CANNA=""
.else
PLIST_SUB+=		CANNA="@comment "
.endif

SITE_INCLUDES+=		${LOCALBASE}/include
SITE_LIBRARIES+=	${LOCALBASE}/lib

# fix .so references in a few man pages
pre-configure:
.for file in etc/ctags.1 etc/gnuattach.1 etc/gnuclient.1 etc/gnudoit.1
	@${SED} -e 's/\.1/&.gz/' ${WRKSRC}/${file} > ${WRKDIR}/tmp_zot
	@${MV} ${WRKDIR}/tmp_zot ${WRKSRC}/${file}
.endfor

pre-build:
	@${FIND} ${WRKSRC} -name \*.orig -exec ${RM} -f \{} \;
	@${RM} -f ${WRKSRC}/lib-src/DOC* ${WRKSRC}/src/xemacs

post-install:
.if !defined(DEBUG)
.for f in b2m ctags ellcc etags gnuclient xemacs-${XEMACS_VER}
	${STRIP_CMD} ${PREFIX}/bin/${f}
.endfor
.endif
# For some reason install no longer makes ${PREFIX}/lib/xemacs/site-lisp.
# Do what PLIST does for pkg_add.
	${MKDIR} ${PREFIX}/lib/xemacs/site-lisp
	${CHMOD} 755 ${PREFIX}/lib/xemacs/site-lisp
	${FIND} ${PREFIX}/lib/xemacs-${XEMACS_VER} -name \*~ \
		-exec ${RM} -f \{} \;
	${RM} -f ${PREFIX}/bin/send-pr
.if defined(PKGNAMEPREFIX)
.if ${PKGNAMEPREFIX} == "ja-"
	@${LN} -sf ja ${PREFIX}/lib/xemacs/mule-packages/etc/app-defaults/ja_JP.eucJP
.endif
.endif

.include <bsd.port.post.mk>
