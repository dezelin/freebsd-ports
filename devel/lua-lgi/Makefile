# $FreeBSD$

PORTNAME=	lgi
PORTVERSION=	0.7.1
CATEGORIES=	devel
PKGNAMEPREFIX=	${LUA_PKGNAMEPREFIX}

MAINTAINER=	andreevmaxim@gmail.com
COMMENT=	Lua bindings to libraries using GObject-Introspection

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
RUN_DEPENDS:=	${BUILD_DEPENDS}

USE_GITHUB=	yes
GH_ACCOUNT=	pavouk
GH_COMMIT=	1bbf1bc

USE_LUA=	5.1+
USE_GMAKE=	yes
USE_PKGCONFIG=	build

CPPFLAGS+=	-I${LOCALBASE}/include/${LUA_SUBDIR}

.include <bsd.port.mk>
