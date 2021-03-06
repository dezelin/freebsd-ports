# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>
# $FreeBSD$

PORTNAME=	multican
DISTVERSION=	0.0.5
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	nemysis@gmx.ch
COMMENT=	Remote control utility for Canon DSLR cameras

LICENSE=	GPLv2

CFLAGS+=	-fPIC	# required at least on amd64
USE_LDCONFIG=	yes

PLIST_FILES=	bin/multican lib/libmultican.so.0 lib/libmultican.so \
		include/canonio.h include/usbio.h

PORTDOCS=	ChangeLog README TODO

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 800069
LIB_DEPENDS=	usb:${PORTSDIR}/devel/libusb
CFLAGS+=	-I${LOCALBASE}/include		# does not uphold CPPFLAGS
LDFLAGS+=	-L${LOCALBASE}/lib
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|endian.h|sys/&|' ${WRKSRC}/canonio.c \
		${WRKSRC}/usbio.c ${WRKSRC}/multican.c

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	${INSTALL_LIB} ${WRKSRC}/libmultican.so.0 ${PREFIX}/lib/
	${LN} -sf libmultican.so.0 ${PREFIX}/lib/libmultican.so
	${INSTALL_DATA} ${WRKSRC}/*.h ${PREFIX}/include

.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
