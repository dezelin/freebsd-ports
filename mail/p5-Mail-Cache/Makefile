# New ports collection makefile for:	p5-Mail-Cache
# Date created:		2009-09-27
# Whom:			Zane C, Bowers <vvelox@vvelox.net>
#
# $FreeBSD$
#

PORTNAME=	Mail-Cache
PORTVERSION=	0.1.2
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:VVELOX
PKGNAMEPREFIX=	p5-

MAINTAINER=	vvelox@vvelox.net
COMMENT=	Caches mail information

BUILD_DEPENDS=	p5-File-BaseDir>=0:${PORTSDIR}/devel/p5-File-BaseDir \
		p5-Email-Simple>=0:${PORTSDIR}/mail/p5-Email-Simple

PERL_CONFIGURE=	yes

MAN3=		Mail::Cache.3

.include <bsd.port.mk>
