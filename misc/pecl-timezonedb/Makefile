# Created by: Marcus Alves Grando <mnag@FreeBSD.org>
# $FreeBSD$

PORTNAME=	timezonedb
DISTVERSION=	2013.2
CATEGORIES=	misc
MASTER_SITES=	http://pecl.php.net/get/
PKGNAMEPREFIX=	pecl-
EXTRACT_SUFX=	.tgz
DIST_SUBDIR=	PECL

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Timezone Database to be used with PHP date and time functions

LICENSE=	PHP30

CONFIGURE_ARGS=	--enable-timezonedb
USE_PHP=	yes
USE_PHPEXT=	yes
IGNORE_WITH_PHP=4

.include <bsd.port.mk>
