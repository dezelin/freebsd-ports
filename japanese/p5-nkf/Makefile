# Created by: max
# $FreeBSD$

CATEGORIES=	japanese perl5
PKGNAMEPREFIX=	ja-p5-

COMMENT=	A perl extension module to use NKF

LICENSE=	ZLIB NKF
LICENSE_COMB=	multi
LICENSE_NAME_NKF=	NKF License
LICENSE_FILE_ZLIB=	${WRKSRC}/NKF.pm
LICENSE_FILE_NKF=	${WRKSRC}/NKF.xs
LICENSE_PERMS_NKF=	${_LICENSE_PERMS_DEFAULT}

DESCR=		${.CURDIR}/pkg-descr
PLIST=		${.CURDIR}/pkg-plist
PERL_CONFIGURE=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}/NKF.mod
PATCHDIR=	${.CURDIR}/files
MAN3=		NKF.3

MASTERDIR=	${.CURDIR}/../nkf

.include "${MASTERDIR}/Makefile"
