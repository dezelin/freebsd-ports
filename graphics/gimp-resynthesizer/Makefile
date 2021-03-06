# Created by: Dmitry Marakasov <amdmi3@FreeBSD.org>
# $FreeBSD$

PORTNAME=	resynthesizer
PORTVERSION=	2.0
CATEGORIES=	graphics
PKGNAMEPREFIX=	gimp-

MAINTAINER=	amdmi3@FreeBSD.org
COMMENT=	Gimp plug-in for texture synthesis

RUN_DEPENDS=	${LOCALBASE}/libexec/gimp/2.2/python/gimpfu.py:${PORTSDIR}/graphics/py-gimp
BUILD_DEPENDS=	intltool-extract:${PORTSDIR}/textproc/intltool
LIB_DEPENDS=	gimp-2.0:${PORTSDIR}/graphics/gimp-app

USE_GITHUB=	yes
GH_ACCOUNT=	bootchk
GH_TAGNAME=	v${PORTVERSION}
GH_COMMIT=	28cade5

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib -lintl"
USE_GETTEXT=	yes
MAKE_JOBS_SAFE=	yes
USE_AUTOTOOLS=	aclocal automake
USE_GMAKE=	yes

OPTIONS_DEFINE=	THREADS
THREADS_DESC=	Threading support (produces nondeterministic results)

.include <bsd.port.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|^\(gimpplugindir=\).*|\1"$$GIMP_LIBDIR"|' \
		${WRKSRC}/configure
.if ! ${PORT_OPTIONS:MTHREADS}
	@${REINPLACE_CMD} -e '/^#define SYNTH_THREADED/ d' \
		${WRKSRC}/src/buildSwitches.h
.endif

post-install:
	@${ECHO_CMD}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_CMD}

.include <bsd.port.mk>
