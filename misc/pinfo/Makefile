# Created by: Thomas Gellekum <tg@FreeBSD.org>
# $FreeBSD$

PORTNAME=	pinfo
PORTVERSION=	0.6.10
CATEGORIES=	misc
MASTER_SITES=	http://alioth.debian.org/frs/download.php/3351/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Ncurses based, lynx style info documentation browser

LICENSE=	GPLv2

OPTIONS_DEFINE=	READLINE
OPTIONS_DEFAULT=READLINE
READLINE_DESC=	Enable readline support

USE_BZIP2=	yes
USE_NCURSES=	yes
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtoolize aclocal autoheader automake autoconf
LIBTOOLIZE_ARGS=--force
ACLOCAL_ARGS=	-I macros
AUTOMAKE_ARGS=	--add-missing --force-missing
CONFIGURE_ARGS=	--with-localedir=${PREFIX}/share/locale
MAKE_JOBS_SAFE=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		pinfo.1
INFO=		pinfo

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

PLIST_FILES=	bin/pinfo etc/pinforc
.for lang in cs de eu ja nl pl pt_BR ro ru sv vi
PLIST_FILES+=	%%NLS%%share/locale/${lang}/LC_MESSAGES/pinfo.mo
.endfor

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MREADLINE}
USE_READLINE=	yes
.else
CONFIGURE_ARGS+=--without-readline
.endif

pre-configure:
	@(cd ${WRKSRC} && ${LOCALBASE}/bin/autopoint)

.include <bsd.port.mk>
