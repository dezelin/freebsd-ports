# Created by: Will Andrews <andrews@technologist.com>
# $FreeBSD$

PORTNAME=	wmminichess
PORTVERSION=	0.8
PORTREVISION=	4
CATEGORIES=	games
MASTER_SITES=	http://web.cs.mun.ca/~gstarkes/wmaker/dockapps/files/
DISTNAME=	miniCHESS-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Window Maker chess dockapp game

LICENSE=	GPLv2 # (or later)

RUN_DEPENDS=	${LOCALBASE}/bin/gnuchess:${PORTSDIR}/games/gnuchess

USE_XORG=	xpm

CPPFLAGS+=	-I${LOCALBASE}/include -DENGINE=\"${LOCALBASE}/bin/gnuchessx\"
LDFLAGS+=	-L${LOCALBASE}/lib -lXpm -lXext -lX11

PORTDOCS=	README TODO
PLIST_FILES=	bin/minichess

.include <bsd.port.options.mk>

do-build:
	(cd ${WRKSRC} \
		&& ${CC} ${CFLAGS} ${CPPFLAGS} -o minichess *.c ${LDFLAGS})

do-install:
	(cd ${WRKSRC} && ${INSTALL_PROGRAM} minichess ${PREFIX}/bin)
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	(cd ${WRKSRC} && ${INSTALL_DATA} ${i} ${DOCSDIR})
.endfor
.endif

.include <bsd.port.mk>
