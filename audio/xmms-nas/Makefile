# New ports collection makefile for:	xmms-nas
# Date created:				29 Sep 2005
# Whom:					James McNaughton
#
# $FreeBSD$
#

PORTNAME=	xmms-nas
PORTVERSION=	0.2
PORTREVISION=	4
CATEGORIES=	audio
MASTER_SITES=	ftp://ftp.stack.nl/pub/users/willem/

MAINTAINER=	bitbucket63-it@yahoo.com
COMMENT=	A Network Audio System (NAS) output plugin for XMMS

LIB_DEPENDS=	xmms.4:${PORTSDIR}/multimedia/xmms \
		audio.2:${PORTSDIR}/audio/nas

USE_GNOME=	gtk12
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

PLIST_FILES=	lib/xmms/Output/libnas.a \
		lib/xmms/Output/libnas.la \
		lib/xmms/Output/libnas.so

post-patch:
	@${REINPLACE_CMD} -e '/objformat=/s|=.*|=elf|' ${WRKSRC}/ltconfig

.include <bsd.port.mk>
