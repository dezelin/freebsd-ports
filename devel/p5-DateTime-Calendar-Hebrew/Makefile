# New ports collection makefile for:	p5-DateTime-Calendar-Hebrew
# Date created:	   3 octobre 2003
# Whom:		   mat
#
# $FreeBSD$
#

PORTNAME=	DateTime-Calendar-Hebrew
PORTVERSION=	0.05
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Dates in the Hebrew calendar

BUILD_DEPENDS=	p5-DateTime>=0:${PORTSDIR}/devel/p5-DateTime \
		p5-DateTime-Event-Sunrise>=0:${PORTSDIR}/devel/p5-DateTime-Event-Sunrise
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		DateTime::Calendar::Hebrew.3

.include <bsd.port.mk>
