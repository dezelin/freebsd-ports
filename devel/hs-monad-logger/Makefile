# $FreeBSD$

PORTNAME=	monad-logger
PORTVERSION=	0.3.0.1
CATEGORIES=	devel haskell

MAINTAINER=	haskell@FreeBSD.org
COMMENT=	A class of monads which can log messages

LICENSE=	MIT

CABAL_SETUP=	Setup.hs

USE_CABAL=	conduit>=1.0 fast-logger>=0.2 monad-control mtl \
		resourcet>=0.4 text transformers transformers-base

.include "${.CURDIR}/../../lang/ghc/bsd.cabal.mk"
.include <bsd.port.mk>
