# Created by: Edwin Groothuis (edwin@mavetju.org)
# $FreeBSD$

PORTNAME=	dnsperf
PORTVERSION=	1.0.1.0
PORTREVISION=	2
CATEGORIES=	dns benchmarks net
MASTER_SITES=	ftp://ftp.nominum.com/pub/nominum/${PORTNAME}/${PORTVERSION}/
DISTNAME=	${PORTNAME}-src-${PORTVERSION}-1

MAINTAINER=	edwin@mavetju.org
COMMENT=	DNSPerf and ResPerf deliver accurate performance metrics of Domain Name Services

BUILD_DEPENDS=	isc-config.sh:${PORTSDIR}/dns/bind97

BROKEN=		fails to build

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--prefix=${PREFIX}

MAKE_ENV=	INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
		INSTALL_SCRIPT="${INSTALL_SCRIPT}" \
		INSTALL_DATA="${INSTALL_DATA}"
PLIST_FILES=	bin/dnsperf bin/resperf	bin/resperf-report
MAN1=		dnsperf.1 resperf.1

.include <bsd.port.mk>
