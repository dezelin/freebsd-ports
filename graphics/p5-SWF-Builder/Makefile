# New ports collection makefile for:	SWF-Builder
# Date created:	   25 December 2003
# Whom:		   Sergey Skvortsov <skv@protey.ru>
#
# $FreeBSD$
#

PORTNAME=	SWF-Builder
PORTVERSION=	0.16
CATEGORIES=	graphics www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Create SWF movie

BUILD_DEPENDS=	p5-SWF-File>=0:${PORTSDIR}/graphics/p5-SWF-File \
		p5-Math-Bezier-Convert>=0:${PORTSDIR}/math/p5-Math-Bezier-Convert \
		p5-Font-TTF>=0:${PORTSDIR}/x11-fonts/p5-Font-TTF
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		SWF::Builder.3 SWF::Builder::ActionScript.3 \
		SWF::Builder::Character::Bitmap.3 \
		SWF::Builder::Character::EditText.3 \
		SWF::Builder::Character::Font.3 \
		SWF::Builder::Character::MovieClip.3 \
		SWF::Builder::Character::Shape.3 \
		SWF::Builder::Character::Sound.3 \
		SWF::Builder::Character::Text.3 SWF::Builder::Gradient.3
MAN1=		asc.plx.1

post-patch:
	@${FIND} ${WRKSRC} -type f |\
		${XARGS} ${PERL} -pi -e 's/\x0d(?=\x0a)//'

post-configure:
	@${PERL} -pi -e 's/^(POD2MAN_EXE.*)$$/\1 --lax/;' ${WRKSRC}/Makefile

.include <bsd.port.mk>
