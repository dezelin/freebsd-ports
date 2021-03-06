# Created by: mbr@FreeBSD.org
# $FreeBSD$

PORTNAME=		open-vm-tools
PORTVERSION=		${BUILD_VER}
PORTREVISION=		3
PORTEPOCH=		1
CATEGORIES=		emulators kld
MASTER_SITES=		SF/${PORTNAME}/${PORTNAME}/stable-8.6.x
DISTNAME=		open-vm-tools-${RELEASE_VER}-${BUILD_VER}

MAINTAINER=		swills@FreeBSD.org
COMMENT?=		Open VMware tools for FreeBSD VMware guests

LICENSE=		LGPL21
LICENSE_FILE=		${WRKSRC}/COPYING

RELEASE_VER=		8.6.0
BUILD_VER=		425873

WRKSRC=			${WRKDIR}/open-vm-tools-${RELEASE_VER}-${BUILD_VER}
GNU_CONFIGURE=		yes
USE_LDCONFIG=		yes
USE_PKGCONFIG=		build
CPPFLAGS+=		-Wno-deprecated-declarations

CONFIGURE_ARGS+=	--without-procps --sysconfdir=${LOCALBASE}/etc
.if defined(WITHOUT_X11)
LIB_DEPENDS+=		glib-2.0:${PORTSDIR}/devel/glib20
CONFIGURE_ARGS+=	--without-x --without-gtk2 --without-gtkmm
PLIST_SUB+=		X11="@comment "
CONFLICTS=		open-vm-tools-[0-9]*
.else
.if !defined(WITHOUT_LIBNOTIFY)
LIB_DEPENDS+=		notify.4:${PORTSDIR}/devel/libnotify
.endif
.if defined(WITH_UNITY)
CONFIGURE_ENV+=		CUSTOM_URIPARSER_CPPFLAGS="-I${LOCALBASE}/include/uriparser"
LIB_DEPENDS+=		uriparser.1:${PORTSDIR}/net/uriparser
.else
CONFIGURE_ARGS+=	--disable-unity
.endif
LIB_DEPENDS+=		gtkmm-2.4:${PORTSDIR}/x11-toolkits/gtkmm24
CONFIGURE_ARGS+=	--with-x
LDFLAGS+=		-L${LOCALBASE}/lib
USE_XORG=		x11 ice sm xext xineramaproto xinerama xrandr xrender \
			xtst
USE_GNOME=		gtk20 glib20
PLIST_SUB+=		X11=""
CONFLICTS=		open-vm-tools-nox11-[0-9]*
.endif

.if !defined(WITHOUT_FUSE)
USES=		fuse
PLIST_SUB+=	FUSE=""
.else
PLIST_SUB+=	FUSE="@comment "
.endif

CONFLICTS+=		vmware-guestd[0-9]* vmware-tools[0-9]*
SUB_FILES=		pkg-message

.if defined(WITHOUT_DNET)
CONFIGURE_ARGS+=	--without-dnet
.else
LIB_DEPENDS+=		dnet:${PORTSDIR}/net/libdnet
.endif

.if defined(WITHOUT_ICU)
CONFIGURE_ARGS+=	--without-icu
.else
LIB_DEPENDS+=		icuuc:${PORTSDIR}/devel/icu
.endif

USE_RC_SUBR=		vmware-guestd vmware-kmod

.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
IGNORE=		not yet ported to sparc64
.endif

post-build:
	(cd ${WRKSRC}/modules && ${MAKE})

post-install:
	${MKDIR} ${PREFIX}/lib/vmware-tools/modules/drivers
	${MKDIR} ${PREFIX}/lib/vmware-tools/modules/input
	${INSTALL_DATA} ${WRKSRC}/modules/freebsd/vmmemctl.ko ${PREFIX}/lib/vmware-tools/modules/drivers/vmmemctl.ko
	${INSTALL_DATA} ${WRKSRC}/modules/freebsd/vmxnet.ko ${PREFIX}/lib/vmware-tools/modules/drivers/vmxnet.ko
	${INSTALL_DATA} ${WRKSRC}/modules/freebsd/vmhgfs.ko ${PREFIX}/lib/vmware-tools/modules/drivers/vmhgfs.ko
	${INSTALL_DATA} ${WRKSRC}/modules/freebsd/vmblock.ko ${PREFIX}/lib/vmware-tools/modules/drivers/vmblock.ko
	@-kldxref ${PREFIX}/lib/vmware-tools/modules/drivers 2>/dev/null
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
