# Created by: Kenneth Vestergaard Schmidt <kvs@pil.dk>
# $FreeBSD$

PORTNAME=	emacs
PORTVERSION=	${EMACS_VER}.${EMACS_REV}
PORTEPOCH=	2
CATEGORIES=	editors ipv6
MASTER_SITES=	http://distfiles.pirateparty.in/%SUBDIR%/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	ashish

MAINTAINER=	ashish@FreeBSD.org
COMMENT=	GNU editing macros

LICENSE=	GPLv3
LICENSE_FILE=	${WRKSRC}/COPYING

MAKE_JOBS_SAFE=	yes

CONFLICTS=	emacs-19.* emacs-21.* emacs-22.* emacs-23.* \
		xemacs-[0-9]* xemacs-devel-[0-9]* \
		xemacs-mule-[0-9]* xemacs-devel-mule-[0-9]* \
		emacs-nox11-[0-9]*

EMACS_VER=	24.3.50
EMACS_REV=	112178
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_NCURSES=	yes
USE_XZ=		yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--localstatedir=/var
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
USE_AUTOTOOLS=	autoconf:env automake:env aclocal:env autoheader:env
INSTALLS_ICONS=	yes

EMACS_DIRS=	${DATADIR}/${EMACS_VER}/leim ${DATADIR}/${EMACS_VER}/lisp ${DATADIR}/${EMACS_VER}/src \
		${PREFIX}/libexec/${PORTNAME}

MAN1=		ctags.1 ebrowse.1 emacs.1 emacsclient.1 etags.1 \
		grep-changelog.1
MANCOMPRESSED=	yes
PLIST_SUB=	EMACS_VER=${EMACS_VER}

MAKE_ENV=	LC_ALL=C

INFO=		ada-mode auth autotype bovine calc ccmode cl dbus dired-x \
		ebrowse ede ediff edt efaq eieio eintr elisp emacs-mime emacs-gnutls emacs epa \
		erc ert eshell eudc flymake forms gnus htmlfontify idlwave info \
		mairix-el message mh-e newsticker nxml-mode \
		org pcl-cvs pgg rcirc reftex remember sasl sc semantic ses sieve \
		smtpmail speedbar srecode tramp url vip viper widget wisent woman

LATEST_LINK=	emacs-devel
OPTIONS_DEFINE=	ACL DBUS GCONF GIF JPEG M17N OTF PNG SOUND SOURCES SVG TIFF SYNC_INPUT SCROLLBARS \
		XFT XIM XML XPM MAGICK GNUTLS GSETTINGS LTO

OPTIONS_SINGLE=	X11TOOLKIT

ACL_DESC=		ACL support
GSETTINGS_DESC=		GSettings support
SCROLLBARS_DESC=	Toolkit scroll-bars
SOUND_DESC=		Sound support
SOURCES_DESC=		Install sources
SYNC_INPUT_DESC=	Synchronously process asynchronous input
XAW_DESC=		Athena widgets
XAW3D_DESC=		Athena3D widgets
XIM_DESC=		X Input Method Support
M17N_DESC=		M17N support for text-shaping
OTF_DESC=		Opentype fonts suport
LTO_DESC=		Enable link-time optimization (requires GCC 4.6+)

OPTIONS_SINGLE_X11TOOLKIT=	GTK2 GTK3 XAW XAW3D MOTIF

OPTIONS_DEFAULT=ACL DBUS GCONF GIF GTK2 JPEG M17N OTF PNG SOUND SOURCES SVG TIFF SYNC_INPUT \
		SCROLLBARS XFT XIM XML XPM MAGICK GNUTLS GSETTINGS

.include <bsd.port.options.mk>

DBUS_PTHREAD_LIBS=	${CC} -dumpspecs | ${GREP} -m 1 pthread: | ${SED} -e 's|^.*%{\!pg: %{pthread:||' -e 's|}.*$$||' || ${TRUE}

.if defined(WITHOUT_X11)
CONFIGURE_ARGS+=	--without-x
.else
USE_XORG=	x11
USE_GNOME=

.if ${PORT_OPTIONS:MSVG}
USE_GNOME+=	librsvg2
.else
CONFIGURE_ARGS+=	--without-rsvg
.endif

.if ${PORT_OPTIONS:MGTK2}
USE_GNOME+=	gtk20
CONFIGURE_ARGS+=	--with-x-toolkit=gtk
.elif ${PORT_OPTIONS:MGTK3}
USE_GNOME+=	gtk30
CONFIGURE_ARGS+=	--with-x-toolkit=gtk3
.elif ${PORT_OPTIONS:MXAW3D}
LIB_DEPENDS+=	Xaw3d:${PORTSDIR}/x11-toolkits/Xaw3d
CONFIGURE_ARGS+=	--with-x-toolkit=athena
.elif ${PORT_OPTIONS:MXAW}
USE_XORG=	xaw
CONFIGURE_ARGS+=	--with-x-toolkit=athena --without-xaw3d
.elif ${PORT_OPTIONS:MMOTIF}
USE_MOTIF=	yes
CONFIGURE_ARGS+=	--with-x-toolkit=motif
.endif

.if !${PORT_OPTIONS:MSCROLLBARS}
CONFIGURE_ARGS+=	--without-toolkit-scroll-bars
.endif

.if !${PORT_OPTIONS:MSYNC_INPUT}
CONFIGURE_ARGS+=	--without-sync-input
.endif

.if ${PORT_OPTIONS:MJPEG}
LIB_DEPENDS+=	jpeg:${PORTSDIR}/graphics/jpeg
.else
CONFIGURE_ARGS+=	--without-jpeg
.endif

.if ${PORT_OPTIONS:MTIFF}
LIB_DEPENDS+=	tiff:${PORTSDIR}/graphics/tiff
.else
CONFIGURE_ARGS+=	--without-tiff
.endif

.if ${PORT_OPTIONS:MGIF}
LIB_DEPENDS+=   gif:${PORTSDIR}/graphics/giflib
.else
CONFIGURE_ARGS+=	--without-gif
.endif

.if ${PORT_OPTIONS:MPNG}
LIB_DEPENDS+=	png15:${PORTSDIR}/graphics/png
.else
CONFIGURE_ARGS+=	--without-png
.endif

.if ${PORT_OPTIONS:MXPM}
USE_XORG+=	xpm
.else
CONFIGURE_ARGS+=	--without-xpm
.endif

.if ${PORT_OPTIONS:MXFT}
USE_XORG+=	xft
LIB_DEPENDS+=	freetype:${PORTSDIR}/print/freetype2
CONFIGURE_ARGS+=	--with-xft
.if ${PORT_OPTIONS:MM17N}
CONFIGURE_ARGS+=	--with-m17n-flt
LIB_DEPENDS+=	m17n:${PORTSDIR}/devel/m17n-lib
.else
CONFIGURE_ARGS+=	--without-m17n-flt
.endif
.if ${PORT_OPTIONS:MOTF}
CONFIGURE_ARGS+=	--with-libotf
LIB_DEPENDS+=	otf:${PORTSDIR}/print/libotf
.else
CONFIGURE_ARGS+=	--without-libotf
.endif
.else
CONFIGURE_ARGS+=	--without-xft
.if ${PORT_OPTIONS:MM17N}
IGNORE=	m17n support for text-shaping requires Xft. Please run 'make config'
.elif ${PORT_OPTIONS:MOTF}
IGNORE=	opentype fonts support requires Xft. Please run 'make config'
.endif
CONFIGURE_ARGS+=	--without-libotf --without-m17n-flt
.endif

.if ${PORT_OPTIONS:MMAGICK}
LIB_DEPENDS+=		MagickCore:${PORTSDIR}/graphics/ImageMagick
CONFIGURE_ARGS+=	--with-imagemagick
.else
CONFIGURE_ARGS+=	--without-imagemagick
.endif

.if ${PORT_OPTIONS:MGSETTINGS}
USE_GNOME+=	glib20
CONFIGURE_ARGS+=	--with-gsettings
.else
CONFIGURE_ARGS+=	--without-gsettings
.endif

.if ${PORT_OPTIONS:MGCONF}
USE_GNOME+=	gconf2
CONFIGURE_ARGS+=	--with-gconf
.else
CONFIGURE_ARGS+=	--without-gconf
.endif

.if ${PORT_OPTIONS:MXIM}
CONFIGURE_ARGS+=	--with-xim
.else
CONFIGURE_ARGS+=	--without-xim
.endif

.endif

.if ${PORT_OPTIONS:MSOUND}
CONFIGURE_ARGS+=	--with-sound
.else
CONFIGURE_ARGS+=	--without-sound
.endif

.if ${PORT_OPTIONS:MDBUS}
LIB_DEPENDS+=	dbus-1:${PORTSDIR}/devel/dbus
CONFIGURE_ARGS+=	--with-dbus
.else
CONFIGURE_ARGS+=	--without-dbus
.if ${PORT_OPTIONS:MGSETTINGS}
IGNORE=	GSettings support requires DBUS. Please run 'make config'
.endif
.endif

.if ${PORT_OPTIONS:MXML}
USE_GNOME+=		libxml2
CONFIGURE_ARGS+=	--with-xml2
.else
CONFIGURE_ARGS+=	--without-xml2
.endif

.if ${PORT_OPTIONS:MGNUTLS}
LIB_DEPENDS+=		gnutls:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=	--with-gnutls
.else
CONFIGURE_ARGS+=	--without-gnutls
.endif

.if ${PORT_OPTIONS:MLTO}
USE_GCC=	4.6+
CONFIGURE_ARGS+=	--enable-link-time-optimization
.endif

.if ${PORT_OPTIONS:MACL}
CONFIGURE_ARGS+=	--with-acl
.else
CONFIGURE_ARGS+=	--without-acl
.endif

.include <bsd.port.pre.mk>

.if ${ARCH} == "ia64"
BROKEN=	Emacs 24.X does not currently build on ia64
.endif

post-patch:
	@${RM} -f ${WRKSRC}/info/*
	@${REINPLACE_CMD} -e "s/%%EMACS_VER%%/${EMACS_VER}/g" -e "s/%%DATADIR%%/${DATADIR:C/\//\\\//g}/g" ${WRKSRC}/sources.el
.if defined(WITHOUT_X11)
	@${REINPLACE_CMD} -e 's/^Terminal=.*$$/Terminal=true/' ${WRKSRC}/etc/emacs.desktop
.endif

post-configure:
	@${REINPLACE_CMD} -e "s/^\(DBUS_LIBS.*\)-pthread\(.*\)$$/\1$$(${DBUS_PTHREAD_LIBS})\2/" ${WRKSRC}/src/Makefile

add-plist-data:
.for i in ${EMACS_DIRS}
	@${FIND} ${i} -type f |${SED} -E -e 's,^${PREFIX}/,,g'  >>${TMPPLIST}
.endfor
	@${FIND} ${WRKSRC}/etc -type f |${SED} -E -e 's,^${WRKSRC},${DATADIR_REL}/${EMACS_VER},g' -e '/etc\/(\..*|ChangeLog|DOC)$$/d' >>${TMPPLIST}
	@${FIND} ${WRKSRC}/etc -type d -depth |${SED} -E -e 's,^${WRKSRC},@dirrm ${DATADIR_REL}/${EMACS_VER},g' >>${TMPPLIST}
.for i in ${EMACS_DIRS}
	@${FIND} ${i} -type d -depth |${SED} -E -e 's,^${PREFIX}/,@dirrm ,g' >>${TMPPLIST}
.endfor
	@${ECHO} "@unexec rmdir %D/${DATADIR_REL}/${EMACS_VER} 2>/dev/null || true" >>${TMPPLIST}

pre-configure:
	@cd ${WRKSRC} && ./autogen.sh

.if defined(WITH_SOURCES)
PLIST_SUB+=	SOURCES=""

post-install:
	@${MKDIR} ${DATADIR}/${EMACS_VER}/src
	@${INSTALL_DATA} ${WRKSRC}/src/*.[ch] ${DATADIR}/${EMACS_VER}/src
	@${INSTALL_DATA} ${WRKSRC}/sources.el ${DATADIR}/${EMACS_VER}/site-lisp/site-start.el
.else
PLIST_SUB+=	SOURCES="@comment "
.endif

.if !defined(WITHOUT_X11)
pre-everything::
	@${ECHO_MSG}
	@${ECHO_MSG} "====> To disable X11 support, define: WITHOUT_X11."
	@${ECHO_MSG}
.endif

.include <bsd.port.post.mk>
