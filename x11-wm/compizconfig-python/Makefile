# Created by: Robert Noland <rnoland@FreeBSD.org>
# $FreeBSD$

PORTNAME=	compizconfig-python
PORTVERSION=	0.8.4
PORTREVISION=	3
CATEGORIES=	x11-wm
MASTER_SITES=	http://releases.compiz.org/${PORTVERSION}/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Python bindings for the compizconfig library

BUILD_DEPENDS=	\
	${LOCALBASE}/libdata/pkgconfig/compiz.pc:${PORTSDIR}/x11-wm/compiz \
	${LOCALBASE}/libdata/pkgconfig/libcompizconfig.pc:${PORTSDIR}/x11-wm/libcompizconfig \
	${PYTHON_SITELIBDIR}/Pyrex/Distutils/__init__.py:${PORTSDIR}/devel/pyrex

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_PYTHON=	-2.7
USE_PKGCONFIG=	build
USES=        pathfix
USE_GNOME=	glib20
USE_AUTOTOOLS=	libtool

post-patch:
	@${REINPLACE_CMD} -e \
		's|[(]libdir[)]/pkgconfig|(prefix)/libdata/pkgconfig|g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
