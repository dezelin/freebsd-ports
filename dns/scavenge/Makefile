# New ports collection makefile for:	scavenge
# Date created:		13 April 2005
# Whom:			mark@foster.cc
#
# $FreeBSD$

PORTNAME=	scavenge
PORTVERSION=	2.0
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	http://mark.foster.cc/pub/scavenge/

MAINTAINER=	mark@foster.cc
COMMENT=	Discover/audit forward and reverse DNS records

RUN_DEPENDS=	p5-Net-DNS>=0:${PORTSDIR}/dns/p5-Net-DNS \
		nmap:${PORTSDIR}/security/nmap

PLIST_FILES=	bin/scavenge

NO_BUILD=	yes
USE_PERL5=	yes

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/src/scavenge ${PREFIX}/bin

.include <bsd.port.mk>
