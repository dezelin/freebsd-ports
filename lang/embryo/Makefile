# Created by: Vanilla I. Shu <vanilla@FreeBSD.org>
# $FreeBSD$

PORTNAME=	embryo
PORTVERSION=	1.7.5
PORTEPOCH=	2
CATEGORIES=	lang enlightenment
MASTER_SITES=	http://download.enlightenment.fr/releases/ \
		LOCAL/gblach/e17/

MAINTAINER=	gblach@FreeBSD.org
COMMENT=	A C like scripting language used in Enlightenment

LICENSE=	BSD

DIST_SUBDIR=	e17
USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_EFL=	eina libtool_hack librt_hack
USE_GNOME=	gnomehack pkgconfig
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 803000
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-src-lib-embryo_float.c
.endif

.include <bsd.port.post.mk>
