# Created by: Thomas Gellekum <tg@FreeBSD.org>
# $FreeBSD$

PORTNAME=	xscrabble
PORTVERSION=	2.12
PORTREVISION=	1
CATEGORIES=	games
MASTER_SITES=	ftp://ftp.ac-grenoble.fr/ge/educational_games/
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${PORTNAME}_en${EXTRACT_SUFX}

MAINTAINER=	dinoex@FreeBSD.org
COMMENT=	X version of the popular board game

USE_BZIP2=	yes
USE_IMAKE=	yes
USE_XORG=	xaw
NO_INSTALL_MANPAGES=	yes

XSCRABBLEDIR=	${PREFIX}/lib/X11/xscrabble

post-patch:
	@${ECHO_CMD} '#define VERSION ${PORTVERSION:S/.//g}' \
		> ${WRKSRC}/src/config.h
	@${ECHO_CMD} '#define DICT_FILE "${XSCRABBLEDIR}/OSPD3.gz"' \
		>> ${WRKSRC}/src/config.h
	@${ECHO_CMD} '#define SCORE_FILE "${XSCRABBLEDIR}/scrabble_scores"' \
		>> ${WRKSRC}/src/config.h
	@${ECHO_CMD} '#define RULES_FILE "${XSCRABBLEDIR}/scrabble_rules"' \
		>> ${WRKSRC}/src/config.h
	@${SED} -e 's|/usr/share/games/scrabble/en|${XSCRABBLEDIR}|g' \
		${WRKSRC}/../xscrabble_en/app-defaults/XScrabble_en \
		> ${WRKSRC}/XScrabble
	@${REINPLACE_CMD} -e 's|= -O|=$$(CDEBUGFLAGS)|g' ${WRKSRC}/Imakefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/xscrab ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/xscrabble ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/XScrabble ${PREFIX}/lib/X11/app-defaults
	@${MKDIR} ${XSCRABBLEDIR}
.for file in OSPD3.gz duplicate scrabble_rules scrabble_scores
	${INSTALL_DATA} ${WRKSRC}/../xscrabble_en/lib/${file} ${XSCRABBLEDIR}
.endfor

.include <bsd.port.mk>
