# $FreeBSD$

PORTNAME=	Plack-Middleware-Reproxy
PORTVERSION=	0.00004
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	kuriyama@FreeBSD.org
COMMENT=	Perl extension to handle X-Reproxy-URL from within Plack

RUN_DEPENDS=	\
	p5-Plack>0:${PORTSDIR}/www/p5-Plack \
	p5-URI>0:${PORTSDIR}/net/p5-URI
BUILD_DEPENDS:=	${RUN_DEPENDS}
TEST_DEPENDS=	p5-TEST-TCP>0:${PORTSDIR}/devel/p5-Test-TCP

PERL_CONFIGURE=	yes

MAN3=	Plack::Middleware::Reproxy.3 \
	Plack::Middleware::Reproxy::Callback.3 \
	Plack::Middleware::Reproxy::Furl.3

.include <bsd.port.mk>
