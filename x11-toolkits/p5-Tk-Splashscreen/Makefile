# New ports collection makefile for:	x11-toolkits/p5-Tk-Splashscreen
# Date created:				02 December 2004
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Tk-Splashscreen
PORTVERSION=	1.0
PORTREVISION=	4
CATEGORIES=	x11-toolkits perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	tobez@FreeBSD.org
COMMENT=	Tk::Splashscreen, display a Splashscreen during program initialization

BUILD_DEPENDS=	p5-Tk>=0:${PORTSDIR}/x11-toolkits/p5-Tk
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	Tk::Splashscreen.3 \
	Tk::waitVariableX.3

.include <bsd.port.mk>
