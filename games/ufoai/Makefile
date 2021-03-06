# Created by:	Alonso Cardenas Marquez <acm@FreeBSD.org>
# $FreeBSD$

PORTNAME=	ufoai
PORTVERSION=	2.4
PORTREVISION=	0
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/UFO_AI%202.x/${PORTVERSION}
DISTNAME=	${PORTNAME:S/$/-/}${PORTVERSION}-source
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	acm@FreeBSD.org
COMMENT=	A strategy game featuring tactical combat

LIB_DEPENDS=	vorbis:${PORTSDIR}/audio/libvorbis \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png \
		curl:${PORTSDIR}/ftp/curl \
		execinfo:${PORTSDIR}/devel/libexecinfo \
		theora.0:${PORTSDIR}/multimedia/libtheora \
		xvidcore.4:${PORTSDIR}/multimedia/xvid
BUILD_DEPENDS=	${LOCALBASE}/include/mxml.h:${PORTSDIR}/textproc/mxml
RUN_DEPENDS=	${LOCALBASE}/share/${PORTNAME}/base/default.cfg:${PORTSDIR}/games/ufoai-data

USE_BZIP2=	yes
USE_GL=		yes
USE_SDL=	sdl image mixer ttf
USE_GETTEXT=	yes
USE_GMAKE=	yes
USE_GNOME=	pkgconfig
USE_OPENAL=	soft
HAS_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-release
CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS} -lexecinfo
CFLAGS+=	-I${LOCALBASE}/include

DATADIR=	share/${PORTNAME}
SUB_FILES=	pkg-message
WRKSRC=		${WRKDIR}/${PORTNAME:S/$/-/}${PORTVERSION}-source
UFO_DIR=	${PREFIX}/lib/${PORTNAME}
UFO_FILES=	ufo ufomodel

OPTIONS_DEFINE=		SERVER UFO2MAP UFORADIANT
OPTIONS_DEFAULT=	SERVER UFO2MAP

SERVER_DESC=		Install dedicated server
UFO2MAP_DESC=		Install UFO tools
UFORADIANT_DESC=	Install UFO map editor

.include <bsd.port.pre.mk>

.if $(PORT_OPTIONS:MSERVER)
CONFIGURE_ARGS+=	--enable-ufoded
UFO_FILES+=	ufoded
PLIST_SUB+=	UFOSERVER=""
.else
CONFIGURE_ARGS+=	--disable-ufoded
PLIST_SUB+=	UFOSERVER="@comment "
.endif

.if $(PORT_OPTIONS:MUFO2MAP)
CONFIGURE_ARGS+=	--enable-ufo2map
UFO_FILES+=	ufo2map
PLIST_SUB+=	UFO2MAP=""
.else
CONFIGURE_ARGS+=	--disable-ufo2map
PLIST_SUB+=	UFO2MAP="@comment "
.endif

.if $(PORT_OPTIONS:MUFORADIANT)
CONFIGURE_ARGS+=--enable-uforadiant
USE_GNOME+=	gtk20 glib20 gtksourceview2 libxml2
LIB_DEPENDS+=	gtkglext-x11-1.0.0:${PORTSDIR}/x11-toolkits/gtkglext
RADIANT_FILE=	uforadiant
RADIANT_DIRS=	bitmaps i18n prefabs sourceviewer
PLIST_SUB+=	UFORADIANT=""
.else
CONFIGURE_ARGS+=--disable-uforadiant
PLIST_SUB+=	UFORADIANT="@comment "
.endif

post-extract:
	@${MKDIR} ${WRKSRC}/base/maps ${WRKSRC}/base/models

# Resolve name collision with jpeg-8 and API png
post-patch:
	${REINPLACE_CMD} -e 's|jpeg_mem_src|local_jpeg_mem_src|' \
		-e 's|png_set_gray_1_2_4_to_8|png_set_expand_gray_1_2_4_to_8|' \
		-e 's|png_check_sig(PngFileBuffer.buffer, 8)|!png_sig_cmp(PngFileBuffer.buffer, 0, 8)|' \
		${WRKSRC}/src/client/renderer/r_image.c

post-build:
	@cd ${WRKSRC} && ${GMAKE} lang
.       if defined(WITH_UFORADIANT)
		@cd ${WRKSRC} && ${GMAKE} uforadiant
.	endif

do-install:
	@${MKDIR} ${UFO_DIR}
.	for FILE in ${UFO_FILES}
	@${SED} \
		-e 's|@UFODIR@|${UFO_DIR}|' \
		-e 's|@APP@|${FILE}|' \
		${FILESDIR}/run.sh.in > ${WRKDIR}/${FILE}
		${INSTALL_PROGRAM} ${WRKSRC}/${FILE} ${UFO_DIR}
		${INSTALL_SCRIPT} ${WRKDIR}/${FILE} ${PREFIX}/bin
.	endfor

		${INSTALL_PROGRAM} ${WRKSRC}/base/game.so ${PREFIX}/${DATADIR}/base

.	if defined(WITH_UFORADIANT)
	@${MKDIR} ${UFO_DIR}/radiant
	@${SED} \
		-e 's|@UFODIR@|${UFO_DIR}/radiant|' \
		-e 's|@APP@|${RADIANT_FILE}|' \
		${FILESDIR}/run.sh.in > ${WRKDIR}/${RADIANT_FILE}
		${INSTALL_PROGRAM} ${WRKSRC}/radiant/${RADIANT_FILE} ${UFO_DIR}/radiant
		${INSTALL_SCRIPT} ${WRKDIR}/${RADIANT_FILE} ${PREFIX}/bin

.		for DIRE in ${RADIANT_DIRS}
			@${MKDIR} ${UFO_DIR}/radiant/${DIRE}
			@cd ${WRKSRC}/radiant/${DIRE} && \
				${FIND} * -type d -exec ${MKDIR} "${UFO_DIR}/radiant/${DIRE}/{}" \; && \
					${FIND} * -type f -exec ${INSTALL_DATA} "{}" "${UFO_DIR}/radiant/${DIRE}/{}" \;
.		endfor
.	endif

	@cd ${WRKSRC}/base/i18n && \
		${FIND} * -type d -exec ${MKDIR} "${PREFIX}/${DATADIR}/base/i18n/{}" \; && \
			${FIND} * -type f -exec ${INSTALL_DATA} "{}" "${PREFIX}/${DATADIR}/base/i18n/{}" \;
	${LN} -s ${PREFIX}/${DATADIR}/base ${UFO_DIR}/base

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
