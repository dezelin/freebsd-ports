# New ports collection makefile for:	py-levenshtein
# Date created:				30 August 2006
# Whom:					Aron Stansvik <elvstone@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	levenshtein
PORTVERSION=	0.10.1
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	GOOGLE_CODE
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python-Levenshtein-${PORTVERSION}

MAINTAINER=	elvstone@gmail.com
COMMENT=	Python extension computing string distances and similarities

LICENSE=	GPLv2

PLIST_FILES=	%%PYTHON_SITELIBDIR%%/Levenshtein.so
USE_BZIP2=	yes
USE_PYTHON=	2.5+
USE_PYTHON_PREFIX=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_PKGNAME=	python-Levenshtein
PROJECTHOST=	py${PORTNAME}

.include <bsd.port.mk>
