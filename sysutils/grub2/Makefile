# Created by: sem@FreeBSD.org
# $FreeBSD$

PORTNAME=	grub2
PORTVERSION=	1.98
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	ftp://alpha.gnu.org/gnu/grub/
DISTNAME=	grub-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Multiboot boot loader

CONFLICTS=	grub-0*

GNU_CONFIGURE=		yes
USE_GMAKE=		yes
USES=			bison
USE_GETTEXT=		yes
ONLY_FOR_ARCHS=		i386 amd64

INFO=		grub

OPTIONS_DEFINE=	MKFONT
MKFONT_DESC=	Build grub-mkfont (require freetype2)

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MMKFONT}
LIB_DEPENDS+=	freetype.9:${PORTSDIR}/print/freetype2
.else
MKFONT=		"@comment "
.endif

PLIST_SUB+=	MKFONT=${MKFONT}

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
