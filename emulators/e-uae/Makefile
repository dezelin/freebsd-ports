# Created by: Miguel Mendez <flynn@energyhq.es.eu.org>
# $FreeBSD$

PORTNAME=	e-uae
DISTVERSION=	0.8.29.w4
PORTREVISION=	7
CATEGORIES=	emulators
MASTER_SITES=	http://www.rcdrummond.net/uae/${DISTNAME}/
DISTNAME=	e-uae-0.8.29-WIP4

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Enhanced version of UAE, the Amiga emulator

CONFLICTS=	uae-[0-9]*
USE_GMAKE=	yes
USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GNOME=	gtk20
USE_SDL=	sdl
CONFIGURE_ARGS=	--with-sdl --with-sdl-gfx
MAKE_JOBS_UNSAFE=	yes

PLIST_FILES=	bin/uae bin/readdisk
PORTDOCS=	ChangeLog README bsdsocket.txt cmd-line.txt \
		compiling.txt configuration.txt floppies.txt \
		joystick.txt keyboard.txt scsi.txt

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/uae ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/readdisk ${PREFIX}/bin

.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/ChangeLog ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/bsdsocket.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/cmd-line.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/compiling.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/configuration.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/floppies.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/joystick.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/keyboard.txt ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/scsi.txt ${DOCSDIR}
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/X11R6/lib/X11/xkb/rules|${LOCALBASE}/share/X11/xkb/rules|' \
	${WRKSRC}/configure

.include <bsd.port.mk>
