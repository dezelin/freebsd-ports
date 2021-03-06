# Created by: Tony Maher <tonym@biolateral.com.au>
# $FreeBSD$

PORTNAME=	wise
PORTVERSION=	2.4.1
CATEGORIES=	biology
MASTER_SITES=	http://www.ebi.ac.uk/~birney/wise2/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Intelligent algorithms for DNA searches

OPTIONS_DEFINE=	DOCS EXAMPLES

BUILD_WRKSRC=	${WRKSRC}/src

USE_GNOME=	glib20
MAKEFILE=	makefile
MAKE_JOBS_SAFE=	yes

SUB_FILES=	pkg-message

PORTDOCS=	*
PORTEXAMPLES=	*
PLIST_FILES=	${BINFILES:S,^,bin/,} ${DATAFILES:S,^,%%DATADIR%%/,}
PLIST_DIRS=	%%DATADIR%%

#
# Actually want an 'ALL_TARGET = all perl' which then requires
# 'USE_PERL5= yes' but the perl sub-build is currently broken.
# The perl stuff is only so you can use the base libraries/functions
# from perl scripts.  This is extra, independent functionality for the
# port and not required for the base system which are C applications.
# When the perl part is fixed, it will require an install line
# something like '@cd ${WRKSRC}/perl/Wise2; ${MAKE} install'
#

BINFILES=	dba dnal estwise estwisedb genewise genewisedb promoterwise \
		psw pswdb scanwise scanwise_server
DATAFILES=	BLOSUM30.bla BLOSUM45.bla BLOSUM62.bla BLOSUM80.bla aa.rnd \
		cb.tmf codon.table gene.stat gon120.bla gon160.bla \
		gon200.bla gon250.bla gon350.bla human.gf human.gp \
		human.stats idenity.bla methods pb.gf pombe.gf tm.pri \
		wise.2 wise.per worm.gf

.include <bsd.port.options.mk>

post-patch:
	@${FIND} ${BUILD_WRKSRC} -name "makefile" | ${XARGS} \
		${REINPLACE_CMD} -e \
		's|^CC =|CC ?=| ; \
		 s|^CFLAGS =|CFLAGS +=| ; \
		 s|-O[0-9] | | ; \
		 s|-g | | ; \
		 s|-g[0-9] | | ; \
		 s|-lpthread|-pthread| ; \
		 s|glib-config|pkg-config glib-2.0| ; \
		 /welcome.csh/s|^|#|'

do-install:
.for i in ${BINFILES}
	(cd ${BUILD_WRKSRC}/bin && ${INSTALL_PROGRAM} ${i} ${PREFIX}/bin)
.endfor
	@${MKDIR} ${DATADIR}
.for i in ${DATAFILES}
	(cd ${WRKSRC}/wisecfg && ${INSTALL_DATA} ${i} ${DATADIR})
.endfor
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	@(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${DOCSDIR})
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	 @${MKDIR} ${EXAMPLESDIR}
	@(cd ${WRKSRC}/test_data && ${COPYTREE_SHARE} . ${EXAMPLESDIR})
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
