# Created by: Grzegorz Blach <gblach@FreeBSD.org>
# $FreeBSD$

PORTNAME=	loader-tga
PORTVERSION=	1.7.5
CATEGORIES=	graphics enlightenment
MASTER_SITES=	http://download.enlightenment.fr/releases/ \
		LOCAL/gblach/e17/
PKGNAMEPREFIX=	evas-
DISTNAME=	${PKGNAMEPREFIX}${PORTVERSION}

MAINTAINER=	gblach@FreeBSD.org
COMMENT=	A hardware accelerated canvas API (TGA loader)

LICENSE=	BSD

DIST_SUBDIR=	e17
USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_EFL=	evas librt_hack libtool_hack
USE_GNOME=	gnomehack pkgconfig
USE_LDCONFIG=	yes

MAKEDIRS=	${WRKSRC}/src/modules/loaders/tga

.include "../evas-core/Makefile.inc"
CONFIGURE_ARGS+=	--enable-image-loader-tga

post-patch:
	@${REINPLACE_CMD} -E \
		-e 's,\$$\(top_builddir\)/src/lib/\.libs,${LOCALBASE}/lib,' \
		-e 's,\$$\(top_builddir\)/src/lib/libevas\.la,-levas,' \
		${MAKEDIRS:S,$,/Makefile.in,}

do-build:
	@(for DIR in ${MAKEDIRS}; do cd $${DIR}; ${SETENV} ${MAKE_ENV} ${MAKE} \
	    ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${ALL_TARGET}; done)

do-install:
	@(for DIR in ${MAKEDIRS}; do cd $${DIR}; ${SETENV} ${MAKE_ENV} ${MAKE} \
	    ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${INSTALL_TARGET}; done)

.include <bsd.port.mk>
