# Created by: Evgeny Zhirnov <jirnov@gmail.com>
# $FreeBSD$

PORTNAME=	archivemount
PORTVERSION=	0.6.1
CATEGORIES=	sysutils
MASTER_SITES=	http://www.cybernoia.de/software/archivemount/

MAINTAINER=	jirnov@gmail.com
COMMENT=	Mount archives with FUSE

PLIST_FILES=	bin/archivemount
MAN1=		archivemount.1

GNU_CONFIGURE=	yes

NO_INSTALL_MANPAGES=	yes
USES=		fuse
USE_GMAKE=	yes
USE_ICONV=	yes
USE_PKGCONFIG=	yes
USE_GCC=	4.2+

.include <bsd.port.mk>
