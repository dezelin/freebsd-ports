# New ports collection makefile for:	distcache
# Date created:				2005-04-13
# Whom:					Marcel Prisi <marcel.prisi@virtua.ch>
#
# $FreeBSD$
#

PORTNAME=	distcache
PORTVERSION=	1.4.5
PORTREVISION=	1
CATEGORIES=	security www
MASTER_SITES=	SF/${PORTNAME}/2.%20${PORTNAME}-stable/${PORTVERSION} \
		http://osdn.dl.sourceforge.net/sourceforge/${PORTNAME}/


MAINTAINER=	marcel.prisi@virtua.ch
COMMENT=	Distributed OpenSSL session caching tools

CONFLICTS=	distcache-devel-*

USE_BZIP2=	yes
USE_RC_SUBR=	dc_server
USE_AUTOTOOLS=	libtool
USE_OPENSSL=	yes
USE_LDCONFIG=	yes

SUB_LIST+=	NAME=dc_server

.if !defined(NOPORTDOCS)
PORTDOCS=	ANNOUNCE BUGS CHANGES FAQ INSTALL LICENSE README
.endif

MAN1=	dc_client.1 dc_server.1 dc_snoop.1 dc_test.1 sslswamp.1
MAN2=	DC_CTX_new.2 DC_PLUG_new.2 DC_PLUG_read.2 DC_SERVER_new.2 \
	NAL_ADDRESS_new.2 NAL_BUFFER_new.2 NAL_CONNECTION_new.2 \
	NAL_LISTENER_new.2 NAL_SELECTOR_new.2 NAL_decode_uint32.2
MAN8=	distcache.8

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
