# New ports collection makefile for:	pure-tk
# Date created:		2011-11-09
# Whom:			Zhihao Yuan <lichray@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	pure-tk
PORTVERSION=	0.3
CATEGORIES=	x11-toolkits

MAINTAINER=	lichray@gmail.com
COMMENT=	A basic interface between Pure and Tcl/Tk

USE_PURE=	yes
USE_TK=	83+
SHORT_TCL_VER=	${TCL_VER:S/8./8/}

MAKE_ARGS+=	tclvers=${TCL_VER}

PLIST_FILES=	lib/pure/gnocl.pure \
		lib/pure/tk.so \
		lib/pure/tk.pure

post-patch:
	${REINPLACE_CMD} \
 		-e "s|/usr/include|${LOCALBASE}/include|g" \
 		-e "s|-ltcl\$$(tclvers)|-ltcl${SHORT_TCL_VER}|" \
 		-e "s|-ltk\$$(tclvers)|-ltk${SHORT_TCL_VER}|" \
		${WRKSRC}/Makefile

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/lang/pure/bsd.pure.mk"
.include <bsd.port.post.mk>
