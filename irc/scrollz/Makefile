# New ports collection makefile for:	ScrollZ
# Date created:		10 Aug 1999
# Whom:			Will Andrews <andrews@technologist.com>
#
# $FreeBSD$
#

PORTNAME=	scrollz
PORTVERSION=	2.2.2
PORTREVISION=	2
CATEGORIES=	irc ipv6
MASTER_SITES=	http://www.netraam.net/scrollz/download/ \
		http://www.scrollz.com/download/
DISTNAME=	ScrollZ-${PORTVERSION}

MAINTAINER=	mdv@unsavoury.net
COMMENT=	Enhanced ircII client that supports scripts, colors, and more

USE_ICONV=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-ipv6 --enable-regexp --enable-iconv
USE_NCURSES=	yes

MAKE_ENV+=	IRCLIB="${PREFIX}/share/scrollz"

PLIST_SUB+=	SCROLLZ_VER="${PORTVERSION}"
PORTDATA=	*

OPTIONS_DEFAULT=	OPENSSL
OPTIONS_RADIO=		SSL
OPTIONS_RADIO_SSL=	GNUTLS OPENSSL

MAN1=	scrollz.1

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MGNUTLS}
BUILD_DEPENDS+=	${LOCALBASE}/lib/libgnutls.a:${PORTSDIR}/security/gnutls
LIB_DEPENDS+=	gnutls:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=	--with-ssl=${LOCALBASE}
.endif

.if ${PORT_OPTIONS:MOPENSSL}
USE_OPENSSL=		yes
CONFIGURE_ARGS+=	--with-openssl=${OPENSSLBASE}
.endif

pre-build:
.if !defined(BATCH)
	@(cd ${WRKSRC}; ${SETENV} ${MAKE_ENV} ${CC} ${CFLAGS} -o SZdist SZdist.c)
	@(cd ${WRKSRC}; ./SZdist)
.endif

.include <bsd.port.mk>
