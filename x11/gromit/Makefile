# Created by: Sergei Kolobov <sergei@kolobov.com>
# $FreeBSD$

PORTNAME=	gromit
PORTVERSION=	20041213
PORTREVISION=	7
CATEGORIES=	x11
MASTER_SITES=	http://www.home.unix-ag.org/simon/gromit/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	GRaphics Over Miscellaneous Objects (Gromit)

USE_GNOME=	gtk20
USE_PKGCONFIG=	build

DOCS=		AUTHORS ChangeLog README

.include <bsd.port.options.mk>

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/gromit ${PREFIX}/bin
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA}   ${WRKSRC}/gromitrc       ${EXAMPLESDIR}
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
