# New ports collection makefile for:	p5-Subtitles
# Date created:		2005-12-28
# Whom:			osa
#
# $FreeBSD$
#

PORTNAME=	Subtitles
PORTVERSION=	1.04
CATEGORIES=	multimedia perl5
MASTER_SITES=	CPAN/Prima/KARASIK
PKGNAMEPREFIX=	p5-

MAINTAINER=	osa@FreeBSD.org
COMMENT=	A Perl5 backend for fix subtitles timing

PERL_CONFIGURE=	yes

MAN1=	subs.1
MAN3=	Subtitles.3

.include <bsd.port.pre.mk>

.if defined(WITH_SUBTITLES_SUBPLAY)
RUN_DEPENDS=	p5-Prima>=0:${PORTSDIR}/x11-toolkits/p5-Prima \
		p5-Time-HiRes>=0:${PORTSDIR}/devel/p5-Time-HiRes

PLIST_SUB+=	SUBPLAY=""
MAN1+=		subplay.1
.else
PLIST_SUB+=	SUBPLAY="@comment "

post-patch:
	@${REINPLACE_CMD} -e "s|\('subs'\), 'subplay'|\1|" ${WRKSRC}/Makefile.PL
.endif

.include <bsd.port.post.mk>
