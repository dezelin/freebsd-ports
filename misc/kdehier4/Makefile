# $FreeBSD$

PORTNAME=	kdehier4
PORTVERSION=	1.0.11
CATEGORIES=	misc kde
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Hierarchy of shared directories for KDE 4 ports

NO_BUILD=	yes
NO_WRKSUBDIR=	yes
USE_KDE4=	kdeprefix

.include <bsd.port.pre.mk>

.if ${KDE4_PREFIX} != ${LOCALBASE}
PLIST_SUB+=	MTREE="" \
		LDCONFIG_DIR="${LDCONFIG_DIR}" \
		LDCONFIG32_DIR="${LDCONFIG32_DIR}"
SUB_FILES=	session-kde4.conf \
		system-kde4.conf
SUB_LIST=	KDE4_PREFIX="${KDE4_PREFIX}"
.else
PLIST_SUB+=	MTREE="@comment "
.endif

do-fetch:
	@${DO_NADA}

do-install:
	@for dir in `${GREP} -v "^@comment" ${FILESDIR}/dirlist`; \
	do \
		${MKDIR} ${PREFIX}/$${dir}; \
	done
.if ${KDE4_PREFIX} != ${LOCALBASE}
	@for dir in `${GREP} -v "^@comment" ${FILESDIR}/mtree-dirlist`; \
	do \
		${MKDIR} ${PREFIX}/$${dir}; \
	done
	${MKDIR} ${LOCALBASE}/etc/dbus-1
	${INSTALL_DATA} ${WRKDIR}/session-kde4.conf ${LOCALBASE}/etc/dbus-1
	${INSTALL_DATA} ${WRKDIR}/system-kde4.conf ${LOCALBASE}/etc/dbus-1
. for dir in pam.d polkit-1 rc.d
	${LN} -sf ${LOCALBASE}/etc/${dir} ${KDE4_PREFIX}/etc/
. endfor
	${LN} -sf ${LOCALBASE}/${LDCONFIG_DIR} ${KDE4_PREFIX}/libdata/
	${ECHO_CMD} ${KDE4_PREFIX}/lib > ${LOCALBASE}/${LDCONFIG_DIR}/kdehier4
	${LN} -sf ${LOCALBASE}/${LDCONFIG32_DIR} ${KDE4_PREFIX}/libdata/
	${LN} -sf ${LOCALBASE}/libdata/pkgconfig ${KDE4_PREFIX}/libdata/
. for dir in services system-services
	${LN} -sf ${LOCALBASE}/share/dbus-1/${dir} ${KDE4_PREFIX}/share/dbus-1/
. endfor
	${LN} -sf ${LOCALBASE}/share/polkit-1/actions ${KDE4_PREFIX}/share/polkit-1/
.endif

maintainer-generate-plist:
	cd ${FILESDIR} && ${SH} make-plist.sh

.include <bsd.port.post.mk>
