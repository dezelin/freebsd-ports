# New ports collection makefile for:	goffice
# Date created:				07 June 2005
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD$
#   $MCom: ports/devel/goffice06/Makefile,v 1.1 2008/09/09 00:10:24 kwm Exp $
#

PORTNAME=	goffice
PORTVERSION=	0.6.6
PORTREVISION=	7
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	GLib/GTK+ set of document centric objects and utilities

LIB_DEPENDS=	pcre.3:${PORTSDIR}/devel/pcre

NO_LATEST_LINK=	yes

DEPRECATED=    depends on libgsf-gnome which is going away.
EXPIRATION_DATE=2013-04-12

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gnomeprefix gnomehack intlhack libgnomeprint libglade2 \
		libgsf_gnome libgnomeui ltverhack
USE_GETTEXT=	yes
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_SUB=	VERSION=${PORTVERSION}

.include <bsd.port.mk>
