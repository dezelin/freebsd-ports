# Ports collection makefile for:	bzrtools
# Date created:		3 November 2005
# Whom:			Ulf Lilleengen
#
# $FreeBSD$
#

PORTNAME=	bzrtools
PORTVERSION=	2.5
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://launchpadlibrarian.net/90479443/

MAINTAINER=	fullermd@over-yonder.net
COMMENT=	Extensions to devel/bzr

RUN_DEPENDS=	bzr:${PORTSDIR}/devel/bzr

OPTIONS=	GRAPHVIZ "Enable graphviz for graph-ancestry" off \
		RSYNC    "Enable rsync for rspush" on

WRKSRC=	${WRKDIR}/bzrtools
USE_PYTHON=	2.6+
USE_PYDISTUTILS=	yes
PYDISTUTILS_PKGVERSION=	2.5.0
PYDISTUTILS_PKGNAME=	BzrTools

.include <bsd.port.pre.mk>

.if defined(WITH_GRAPHVIZ)
RUN_DEPENDS+=	dot:${PORTSDIR}/graphics/graphviz
.endif

.if !defined(WITHOUT_RSYNC)
RUN_DEPENDS+=	rsync:${PORTSDIR}/net/rsync
.endif

.include <bsd.port.post.mk>
