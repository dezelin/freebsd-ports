# New ports collection makefile for:	devel/p5-File-CreationTime
# Date created:				04 April 2007
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	File-CreationTime
PORTVERSION=	2.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	tobez@FreeBSD.org
COMMENT=	Keeps track of file creation times

BUILD_DEPENDS=	p5-File-Attributes>=0:${PORTSDIR}/devel/p5-File-Attributes
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	File::CreationTime.3

.include <bsd.port.mk>
