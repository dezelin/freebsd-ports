# New ports collection makefile for:	kgrubeditor
# Date created:		2009-02-07
# Whom:			Gvozdikov Veniamin <g.veniamin@googlemail.com>
#
# $FreeBSD$
#

PORTNAME=	kgrubeditor
PORTVERSION=	0.8.5
PORTREVISION=	6
CATEGORIES=	sysutils kde
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/KGRUBEditor%20${PORTVERSION}
DISTNAME=	KGRUBEditor-${PORTVERSION}-src

MAINTAINER=	g.veniamin@googlemail.com
COMMENT=	GRUB configuration utility for KDE

RUN_DEPENDS=	grub:${PORTSDIR}/sysutils/grub

USE_BZIP2=	yes
USES=		cmake
USE_KDE4=	automoc4 kdeprefix kdelibs
USE_QT4=	gui qmake_build moc_build rcc_build uic_build
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.mk>
