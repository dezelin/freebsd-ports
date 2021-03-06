# New ports collection makefile for:	libimobiledevice
# Date created:				10 June 2010
# Whom:					Alberto Villa <avilla@FreeBSD.org>
#
# $FreeBSD$

PORTNAME=	libimobiledevice
PORTVERSION=	1.0.7
PORTREVISION=	2
CATEGORIES=	comms
MASTER_SITES=	http://www.${PORTNAME}.org/downloads/

MAINTAINER=	avilla@FreeBSD.org
COMMENT=	Library to communicate with Apple iPhone/iPod Touch devices

LICENSE=	LGPL21
LICENSE_FILE=	${WRKSRC}/COPYING.LESSER

LIB_DEPENDS=	gnutls.26:${PORTSDIR}/security/gnutls \
		tasn1.5:${PORTSDIR}/security/libtasn1 \
		gcrypt.18:${PORTSDIR}/security/libgcrypt \
		plist.1:${PORTSDIR}/devel/libplist \
		usbmuxd.1:${PORTSDIR}/comms/usbmuxd

USE_GNOME=	glib20
USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_CSTD=	gnu89
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

PORTDOCS=	AUTHORS NEWS README

MAN1=		idevice_id.1 idevicebackup.1 ideviceenterrecovery.1 \
		ideviceimagemounter.1 ideviceinfo.1 idevicepair.1 \
		idevicescreenshot.1 idevicesyslog.1

#OPTIONS=	PYTHON	"Enable Python bindings (needs Swig)" off
#
#.include <bsd.port.options.mk>
#
#.ifdef(WITH_PYTHON)
#BUILD_DEPENDS=	swig:${PORTSDIR}/devel/swig13
#USE_PYTHON=	yes
#PLIST_SUB+=	PYTHON=""
#.else
CONFIGURE_ARGS+=	--without-swig
#PLIST_SUB+=	PYTHON="@comment "
#.endif

pre-configure:
	${REINPLACE_CMD} -e 's|$$(libdir)/pkgconfig|${PREFIX}/libdata/pkgconfig|g' \
		${WRKSRC}/Makefile.in

post-install:
.ifndef(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
