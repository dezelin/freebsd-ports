# New ports collection makefile for:	gloox
# Date created:			24 April 2006
# Whom:				trasz
#
# $FreeBSD$
#

PORTNAME=	gloox
PORTVERSION=	1.0
PORTREVISION=	3
CATEGORIES=	net-im
MASTER_SITES=	http://camaya.net/download/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Jabber/XMPP client library

LIB_DEPENDS=	idn.17:${PORTSDIR}/dns/libidn \
		gnutls.26:${PORTSDIR}/security/gnutls

USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USES=	pathfix
GNU_CONFIGURE=	yes
CPPFLAGS+=	${CXXFLAGS} -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|libgnutls-config|pkg-config gnutls|' ${WRKSRC}/configure
post-install:
	@${FIND} ${PREFIX}/include/gloox ! -type d | \
		${SED} "s,${PREFIX}/,," >> ${TMPPLIST}
	@${FIND} ${PREFIX}/include/gloox -type d | ${SORT} -r | \
		${SED} "s,${PREFIX}/,@dirrm ," >> ${TMPPLIST}

.include <bsd.port.mk>
