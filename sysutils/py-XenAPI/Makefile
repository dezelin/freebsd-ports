# New ports collection makefile for:	py-XenAPI
# Date created:				13 April 2012
# Whom:					Evan Sarmiento <bsdports@wayfair.com>
#
# $FreeBSD$
#

PORTNAME=	XenAPI
PORTVERSION=	1.0
CATEGORIES=	sysutils python
MASTER_SITES=	http://community.citrix.com/download/attachments/38633496/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.py
EXTRACT_ONLY=

MAINTAINER=	bsdports@wayfair.com
COMMENT=	Xen API Library for Python

USE_PYTHON=	-2.7
WRKSRC=		${WRKDIR}/${PORTNAME}
PLIST_FILES=	%%PYTHON_SITELIBDIR%%/XenAPI.py \
		%%PYTHON_SITELIBDIR%%/XenAPI.pyc \
		%%PYTHON_SITELIBDIR%%/XenAPI.pyo

post-patch:
	${MKDIR} ${WRKSRC}
	${CP} ${DISTDIR}/${DISTFILES} ${WRKSRC}

do-build:
	@${PYTHON_CMD} -m py_compile ${WRKSRC}/${DISTFILES}
	@${PYTHON_CMD} -O -m py_compile ${WRKSRC}/${DISTFILES}

do-install:
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.py* ${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
