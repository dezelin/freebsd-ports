# Created by: Ion-Mihai "IOnut" Tetcu<itetcu@FreeBSD.org>
# $FreeBSD$

PORTNAME=	SoftMaker-Office
PORTVERSION=	2006
PORTREVISION=	2
CATEGORIES=	editors
MASTER_SITES=	http://www.softmaker.net/down/
DISTFILES=	ofb06trial.tgz

MAINTAINER=	itetcu@FreeBSD.org
COMMENT=	Microsoft Word/Excel OpenDocument and OpenOffice.org editor

RUN_DEPENDS=	${LOCALBASE}/bin/xfs:${X_FONTSERVER_PORT}

USE_XORG=	x11

NO_BUILD=	yes

WRKSRC=		${WRKDIR}/officetrial

OPTIONS_DEFINE=	ALL_DICTS
OPTIONS_DEFAULT=	ALL_DICTS
ALL_DICTS_DESC=	Install all available dictionaries

NO_CDROM=	distribution with other products of any kind forbiden
NO_PACKAGE=	distribution with other products of any kind forbiden

ONLY_FOR_ARCHS=	i386

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MALL_DICTS}
DISTFILES+=	sml06dict.tgz
.endif

post-extract:
	cd ${WRKSRC} && ${FIND} . -type f -execdir ${CHMOD} ${SHAREMODE} \{\} \; && \
		${CHMOD} ${BINMODE} planmaker textmaker

do-install:
	${MKDIR} ${PREFIX}/${PORTNAME}
	cd ${WRKSRC} && ${CP} -Rp . ${PREFIX}/${PORTNAME}
	${LN} -s ${PREFIX}/${PORTNAME}/planmaker ${PREFIX}/bin/planmaker
	${LN} -s ${PREFIX}/${PORTNAME}/textmaker ${PREFIX}/bin/textmaker

.include <bsd.port.mk>
