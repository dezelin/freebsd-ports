# Created by: Nik Clayton <nik@FreeBSD.org>
# $FreeBSD$

PORTNAME=	data
DISTVERSION=	1.32b-3
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_IDSOFTWARE}
MASTER_SITE_SUBDIR=	quake3/linux
PKGNAMEPREFIX=	${Q3PKGNAMEPREFIX}
DISTNAME=	linuxq3apoint-${DISTVERSION}.x86
EXTRACT_SUFX=	.run

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Quake III Arena data files

DATADIR=	${Q3DIR}
NO_BUILD=	yes
NO_WRKSUBDIR=	yes

SUB_FILES=	pkg-message

OPTIONS_DEFINE=	TEAMARENA
OPTIONS_DEFAULT=	TEAMARENA
TEAMARENA_DESC=		Install Quake III Team Arena data files

.include "Makefile.include"
.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MTEAMARENA}
PLIST_SUB+=	TEAMARENA=""
.else
PLIST_SUB+=	TEAMARENA="@comment "
.endif

do-extract:
	@${RM} -rf ${WRKDIR}
	@${MKDIR} ${WRKDIR}
	@cd ${WRKDIR} && ${TAIL} +356 ${_DISTDIR}/${DISTNAME}${EXTRACT_SUFX} | \
		${TAR} zxf - >/dev/null

do-install:
	@${MKDIR} ${DATADIR}
	${CP} -R ${WRKSRC}/baseq3 ${DATADIR}
	@${MKDIR} ${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKSRC}/quake3.xpm ${PREFIX}/share/pixmaps
.if ${PORT_OPTIONS:MTEAMARENA}
	${CP} -R ${WRKSRC}/missionpack ${DATADIR}
.endif

post-install:
	@${ECHO_CMD}
	@${CAT} ${PKGMESSAGE}
	@${ECHO_CMD}

.include <bsd.port.mk>
