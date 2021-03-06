# Created by: Martin Matuska <mm@FreeBSD.org>
# $FreeBSD$

PORTNAME=	tk
PORTVERSION=	8.6.0
CATEGORIES=	x11-toolkits
MASTER_SITES=	SF/tcl/Tcl/${PORTVERSION} \
		${MASTER_SITE_TCLTK}
MASTER_SITE_SUBDIR=tcl8_6
DISTNAME=	${PORTNAME}${PORTVERSION}-src

MAINTAINER=	tcltk@FreeBSD.org
COMMENT=	Graphical toolkit for Tcl

LICENSE=	BSD
LICENSE_FILE=	${WRKSRC}/../license.terms

OPTIONS_DEFINE=	TKMAN DEMOS XFT THREADS
OPTIONS_DEFAULT=XFT THREADS
TKMAN_DESC=	Install Tk function manpages
DEMOS_DESC=	Install demos

WRKSRC=		${WRKDIR}/${PORTNAME}${PORTVERSION}/unix

ALL_TARGET=	all
INSTALL_TARGET=	install

USE_LDCONFIG=	yes
USE_TCL=	${SHORT_TK_VER}
USE_XORG=	x11
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared \
		--enable-man-suffix=.${MAN_SUFFIX} \
		--with-tcl=${TCL_LIBDIR} \
		--includedir=${PREFIX}/include/tk${TK_VER}

CONFIGURE_ENV=	PORTSDIR=${PORTSDIR}

CFLAGS+=	-I${TCL_INCLUDEDIR} \
		-I${LOCALBASE}/include

TK_VER=		${PORTVERSION:R}
SHORT_TK_VER=	${TK_VER:S/.//}
LATEST_LINK=	${PORTNAME}${SHORT_TK_VER}
MAN_SUFFIX=	${LATEST_LINK}

MAKE_ENV=	SHORT_TK_VER=${SHORT_TK_VER}

PLIST_SUB=	TK_VER=${TK_VER} \
		SHORT_TK_VER=${SHORT_TK_VER}

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MXFT}
CONFIGURE_ARGS+=--enable-xft
LIB_DEPENDS+=	Xft:${PORTSDIR}/x11-fonts/libXft
.else
CONFIGURE_ARGS+=--disable-xft
.endif

.if ${PORT_OPTIONS:MDEMOS}
INSTALL_TARGET+=	install install-demos
PLIST_SUB+=	DEMOS=""
.else
PLIST_SUB+=	DEMOS="@comment "
.endif

.if ${PORT_OPTIONS:MTKMAN} && !defined(NO_INSTALL_MANPAGES)
INSTALL_TARGET+=install-doc
.include "${.CURDIR}/Makefile.man"
.endif

.if ${PORT_OPTIONS:MTHREADS}
CONFIGURE_ARGS+=--enable-threads
.else
CONFIGURE_ARGS+=--disable-threads
.endif

regression-test:	build
	cd ${WRKSRC}; ${MAKE} test
	${ECHO_CMD} "package require Tk" | tclsh${TK_VER}
	${ECHO_CMD} "load libtk${SHORT_TK_VER}.so" | tclsh${TK_VER}

.include <bsd.port.mk>
