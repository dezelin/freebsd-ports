# $FreeBSD$

PORTNAME=	virtualmin
PORTVERSION=	3.99
CATEGORIES=	sysutils
MASTER_SITES=	http://download.webmin.com/download/virtualmin/
DISTNAME=	virtual-server-${PORTVERSION}.gpl
EXTRACT_SUFX=	.wbm.gz

MAINTAINER=	olgeni@FreeBSD.org
COMMENT=	A virtual hosting management system based on webmin

RUN_DEPENDS=	${LOCALBASE}/lib/webmin/webmin-init:${PORTSDIR}/sysutils/webmin

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/virtual-server

post-extract:
	@${RM} -r ${WRKSRC}/images/.xvpics
	@${FIND} ${WRKSRC} -name "*.swp" -delete
	@${FIND} ${WRKSRC} -name "*.cgi" | ${XARGS} ${REINPLACE_CMD} -e "s@/usr/local/bin/perl@${PERL}@"
	@${FIND} ${WRKSRC} -name "*.bak" -delete
	@${FIND} ${WRKSRC} -name "*.cgi" | ${XARGS} ${CHMOD} 755
	@${FIND} ${WRKSRC} -type d -empty | ${XARGS} ${RMDIR}

do-install:
	@${MKDIR} ${PREFIX}/lib/webmin
	@${MKDIR} ${PREFIX}/etc/webmin/virtual-server
	@${CP} -r ${WRKSRC} ${PREFIX}/lib/webmin

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
