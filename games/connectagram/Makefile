# Created by: nemysis@gmx.ch
# $FreeBSD$

PORTNAME=	connectagram
PORTVERSION=	1.1.0
CATEGORIES=	games
MASTER_SITES=	http://gottcode.org/${PORTNAME}/
EXTRACT_SUFX=	-src.tar.bz2

MAINTAINER=	nemysis@gmx.ch
COMMENT=	Word unscrambling game

LICENSE=	GPLv3

USE_BZIP2=	yes
USE_QT4=	moc_build qmake_build rcc_build gui network
INSTALLS_ICONS=	yes
MAKE_JOBS_SAFE=	yes

PORTDOCS=	CREDITS ChangeLog

.include <bsd.port.options.mk>

do-configure:
	@cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} \
		${QMAKE} ${QMAKEFLAGS} PREFIX=${PREFIX}

post-install:
	@(cd ${WRKSRC} && ${COPYTREE_SHARE} data ${DATADIR})
	@(cd ${WRKSRC}/icons && ${COPYTREE_SHARE} patterns ${DATADIR})
	@(cd ${WRKSRC}/icons && ${COPYTREE_SHARE} hicolor ${PREFIX}/icons/)
	${LN} -sf ${PREFIX}/share/icons/hicolor/48x48/apps/${PORTNAME}.png ${PREFIX}/share/pixmaps/

.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.mk>
