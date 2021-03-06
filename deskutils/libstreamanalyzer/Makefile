# $FreeBSD$

PORTNAME=	libstreamanalyzer
PORTVERSION=	${STRIGI_VERSION}
CATEGORIES=	deskutils
MASTER_SITES=	${STRIGI_MASTER_SITES}

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Strigi desktop search: streamanalyzer library

LIB_DEPENDS=	avcodec${FFMPEG_SUFFIX}:${PORTSDIR}/multimedia/ffmpeg${FFMPEG_SUFFIX} \
		clucene-core:${PORTSDIR}/textproc/clucene \
		exiv2:${PORTSDIR}/graphics/exiv2 \
		streams:${PORTSDIR}/deskutils/libstreams

USE_ICONV=	yes
USE_GNOME=	libxml2
USE_PKGCONFIG=	build
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

# supported versions: ffmpeg, ffmpeg1, ffmpeg-devel
# corresponding FFMPEG_SUFFIX: '', '1', '-devel'
FFMPEG_SUFFIX?=	1
CMAKE_ARGS+=	-DFFMPEG_SUFFIX:STRING="${FFMPEG_SUFFIX}"

.if !empty(FFMPEG_SUFFIX)
# Reorder include directories to allow build with multiple ffmpeg installed.
# This patch must NOT be used, if ffmpeg headers are installed
# directly to ${LOCALBASE}/include
EXTRA_PATCHES+=	${FILESDIR}/extrapatch-libstreamanalyzer__plugins__endplugins__CMakeLists.txt
.endif

post-patch:
	${REINPLACE_CMD} -e \
		's,$${LIB_DESTINATION}/pkgconfig,libdata/pkgconfig,' \
		${WRKSRC}/libstreamanalyzer/CMakeLists.txt

.include <${.CURDIR}/../strigi/Makefile.common>
.include <bsd.port.mk>
