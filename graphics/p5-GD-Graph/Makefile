# New ports collection makefile for:	p5-GD-Graph
# Date created:				21 February 2000
# Whom:	      				Dmitry Sivachenko <dima@Chg.RU>
#
# $FreeBSD$
#

PORTNAME=	GD-Graph
PORTVERSION=	1.44.01
DISTVERSION=	${PORTVERSION:C/\.(..)$/_\1/}
PORTREVISION=	5
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:BWARFIELD
PKGNAMEPREFIX=	p5-
DISTNAME=	GDGraph-${DISTVERSION}

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Graph plotting module for perl5

BUILD_DEPENDS=	p5-GD>=0:${PORTSDIR}/graphics/p5-GD \
		p5-GD-TextUtil>=0:${PORTSDIR}/graphics/p5-GD-TextUtil
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		GD::Graph.3 \
		GD::Graph::Data.3 \
		GD::Graph::Error.3 \
		GD::Graph::FAQ.3 \
		GD::Graph::colour.3 \
		GD::Graph::hbars.3

.include <bsd.port.mk>
