# Created by: G_ran Runfeldt <goranrunfeldt@home.se>
# $FreeBSD$

PORTNAME=	xevil
PORTVERSION=	2.02.r2
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}.mirror \
		http://www.xevil.com/download/stable/
DISTNAME=	${PORTNAME}src${PORTVERSION:S/.r/r/}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A fast-action, networked, anti-social, kill-everything game

LICENSE=	GPLv2

OPTIONS_DEFINE=	DOCS

NO_WRKSUBDIR=yes

BROKEN=		does not build

USE_ZIP=	yes
USE_XORG=	xpm
USE_DOS2UNIX=	*.cpp *.h config.mk makefile
MAKEFILE=	makefile
MAKE_ARGS=	DEPTH="${WKRSRC}"
ALL_TARGET=	${OPSYS:L}
MAKE_JOBS_SAFE=	yes

PORTDOCS=	*
PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.options.mk>

port-patch:
	@${FIND} ${WRKSRC} -name "*.xpm" | ${XARGS} ${REINPLACE_CMD} -e \
		's|^static char|static const char|'

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/x11/${OPSYS:U}/${PORTNAME} ${PREFIX}/bin
.if ${PORT_OPTIONS:MDOCS}
	@{MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}
	@${MKDIR} ${DOCSDIR}/instructions
	${INSTALL_DATA} ${WRKSRC}/instructions/* ${DOCSDIR}/instructions
.endif

.include <bsd.port.mk>
