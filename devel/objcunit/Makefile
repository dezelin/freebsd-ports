# $FreeBSD$

PORTNAME=	objcunit
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	devel gnustep
MASTER_SITES=	http://xanthippe.dyndns.org/Zipper/
PKGNAMEPREFIX=	gnustep-
DISTNAME=	ObjcUnit-${PORTVERSION}-GNUstep

MAINTAINER=	ports@FreeBSD.org
COMMENT=	ObjcUnit framework for GNUstep

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/ObjcUnit-${PORTVERSION}/ObjcUnit
ADDITIONAL_INCLUDE_DIRS+=	-I${WRKSRC}

post-patch:
	${LN} -s "Classes" ${WRKSRC}/ObjcUnit

.include <bsd.port.mk>
