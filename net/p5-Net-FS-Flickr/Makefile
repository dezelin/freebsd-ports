# New ports collection makefile for:	p5-Net-FS-Flickr
# Date created:		2006-07-30
# Whom:			Tsung-Han Yeh <snowfly@yuntech.edu.tw>
#
# $FreeBSD$
#

PORTNAME=	Net-FS-Flickr
PORTVERSION=	0.1
PORTREVISION=	6
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	snowfly@yuntech.edu.tw
COMMENT=	A Perl interface for store and retrieve files on Flickr

BUILD_DEPENDS=	p5-libwww>=0:${PORTSDIR}/www/p5-libwww \
		p5-Acme-Steganography-Image-Png>=0:${PORTSDIR}/graphics/p5-Acme-Steganography-Image-Png \
		p5-Flickr-Upload>=0:${PORTSDIR}/www/p5-Flickr-Upload
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_MODBUILD=	yes

MAN1=		flickrfs.1
MAN3=		Net::FS::Flickr.3 \
		Net::FS::Flickr::Access.3

.include <bsd.port.mk>
