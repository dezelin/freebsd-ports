# $FreeBSD$

PORTNAME=	galculator
PORTVERSION=	2.1
CATEGORIES=	math
MASTER_SITES=	SF

MAINTAINER=	naddy@FreeBSD.org
COMMENT=	GTK-based scientific calculator

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-gtk3
MAKE_JOBS_SAFE=	yes

# The existence of libquadmath with sinhq() on a system does not
# guarantee that the compiler actually supports GCC libquadmath.
CONFIGURE_ENV=	ac_cv_lib_quadmath_sinhq=no

MAN1=		galculator.1

.include <bsd.port.mk>
