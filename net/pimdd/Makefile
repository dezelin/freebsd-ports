# New ports collection makefile for:	pimdd
# Date created:		18 March 2004
# Whom:			Bruce M Simpson <bms@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	pimdd
PORTVERSION=	0.2.1.0
CATEGORIES=	net
MASTER_SITES=	http://antc.uoregon.edu/PIMDM/
DISTNAME=	pimd-dense

MAINTAINER=	ports@FreeBSD.org
COMMENT=	UO Dense Protocol-Independent Multicast (PIM-DM) daemon for IPv4

NO_MAN=	yes

PLIST_FILES=	sbin/pimdd \
		etc/pimdd.conf.sample

PORTDOCS=	pimd-dense.html README CHANGES RELEASE.NOTES

.include <bsd.port.pre.mk>

EXTRA_PATCHES=	${FILESDIR}/extra-patch-defs.h

post-patch:
	${REINPLACE_CMD} -e 's|/etc/pimd.conf|${PREFIX}/etc/pimd.conf|g' ${WRKSRC}/pathnames.h

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/pimdd ${PREFIX}/sbin/pimdd
	${INSTALL_DATA} ${WRKSRC}/pimdd.conf ${PREFIX}/etc/pimdd.conf.sample
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_MAN} ${WRKSRC}/${i} ${DOCSDIR}/${i}
.endfor
.endif

.include <bsd.port.post.mk>
