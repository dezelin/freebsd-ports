# Created by: Charlie Kester <corky1951@comcast.net>
# $FreeBSD$

PORTNAME=	moreutils-parallel
PORTVERSION=	0.47
CATEGORIES=	sysutils
MASTER_SITES=	DEBIAN
MASTER_SITE_SUBDIR=	pool/main/m/moreutils
DISTNAME=	moreutils_${PORTVERSION}

MAINTAINER=	eadler@FreeBSD.org
COMMENT=	Run programs in parallel

CONFLICTS=	parallel-[0-9]*

WRKSRC=		${WRKDIR}/moreutils

MAN1=		parallel.1
MANCOMPRESSED=	no
PLIST_FILES=	bin/parallel

MAKE_JOBS_SAFE=	yes

post-patch:
	${CP} ${FILESDIR}/parallel.1 ${WRKSRC}/

post-install:
	cd ${WRKSRC} && ${INSTALL_MAN} ${MAN1} ${MANPREFIX}/man/man1/

.include <bsd.port.mk>
