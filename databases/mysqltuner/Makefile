# New ports collection makefile for:   mysqltuner
# Date created:		09 September 2008
# Whom:			Wen heping <wenheping@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	mysqltuner
PORTVERSION=	1.2.0
PORTREVISION=	2
CATEGORIES=	databases
MASTER_SITES=	https://github.com/downloads/me-vlad/MySQLTuner-perl/

MAINTAINER=	vlad@vlad.uz.ua
COMMENT=	A Script Assist You with MySQL Configuration

LICENSE=	GPLv3

FETCH_ARGS=	-pRr
USE_PERL5=	yes
NO_BUILD=	yes

PLIST_FILES=	bin/${PORTNAME}.pl

PORTDOCS=	README

.include <bsd.port.pre.mk>
do-install:
	@${CP} ${WRKSRC}/${PORTNAME}.pl ${PREFIX}/bin/${PORTNAME}.pl
	@${CHMOD} 755 ${PREFIX}/bin/${PORTNAME}.pl
	@${ECHO_CMD} '@exec ${CHMOD} 755 ${PREFIX}/bin/${PORTNAME}.pl' \
		>> ${TMPPLIST}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
