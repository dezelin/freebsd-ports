# New ports collection makefile for:	fcitx-ui-light
# Date created:				09 Nov 2011
# Whom:			Zhihao Yuan <lichray@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	fcitx-ui-light
PORTVERSION=	0.1.3
PORTREVISION=	1
CATEGORIES=	chinese
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}
DIST_SUBDIR=	fcitx

MAINTAINER=	lichray@gmail.com
COMMENT=	An alternative light weight UI for Fcitx

LIB_DEPENDS=	fcitx-config.4:${PORTSDIR}/chinese/fcitx \
		fontconfig.1:${PORTSDIR}/x11-fonts/fontconfig

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_XORG=	x11 xft xpm
USES=		cmake
USE_GNOME=	intltool

PROJECTHOST=	fcitx

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
