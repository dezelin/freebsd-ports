# New ports collection makefile for:   cidr
# Date created:		18 Jun 2000
# Whom:			Domas Mituzas <midom@dammit.lt>
#
# $FreeBSD$

PORTNAME=	cidr
PORTVERSION=	2.3.2
PORTREVISION=	1
CATEGORIES=	net-mgmt
MASTER_SITES=	CRITICAL

MAINTAINER=	ehaupt@FreeBSD.org
COMMENT=	RFC 1878 subnet calculator / helper

MAKE_JOBS_SAFE=	yes

MAN1=		cidr.1
PLIST_FILES=	bin/cidr

do-build:
	${CC} ${CFLAGS} ${WRKSRC}/${PORTNAME}.c -o ${WRKSRC}/${PORTNAME}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MANPREFIX}/man/man1

.include <bsd.port.mk>
