# New ports collection makefile for:   panomatic
# Date created:        Fri Mar  7 11:06:34 UTC 2008
# Whom:                argv[0] (Iouri V. Ivliev)
#
# $FreeBSD$

PORTNAME=	panomatic
PORTVERSION=	0.9.4
CATEGORIES=	graphics
MASTER_SITES=	SF
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ii@any.com.ru
COMMENT=	A tool that automates the creation of control points

BUILD_DEPENDS=	bjam:${PORTSDIR}/devel/boost-jam \
		${LOCALBASE}/include/boost/format.hpp:${PORTSDIR}/devel/boost-libs

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-boost=${LOCALBASE}/include
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_DOS2UNIX=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

PLIST_FILES=	bin/panomatic

.include <bsd.port.mk>
