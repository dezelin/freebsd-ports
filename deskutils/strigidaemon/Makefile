# $FreeBSD$

PORTNAME=	strigidaemon
PORTVERSION=	${STRIGI_VERSION}
CATEGORIES=	deskutils
MASTER_SITES=	${STRIGI_MASTER_SITES}

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Strigi desktop search: daemon

LIB_DEPENDS=	dbus-1:${PORTSDIR}/devel/dbus \
		streams:${PORTSDIR}/deskutils/libstreams \
		streamanalyzer:${PORTSDIR}/deskutils/libstreamanalyzer

USE_FAM=	yes
USE_GNOME=	libxml2
USE_PKGCONFIG=	build
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

.include <${.CURDIR}/../strigi/Makefile.common>
.include <bsd.port.mk>
