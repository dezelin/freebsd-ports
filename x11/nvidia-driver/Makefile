# Created by: Stijn Hoop <stijn@win.tue.nl>
# $FreeBSD$
#
# For those wondering why this port is not under `x11-drivers' category,
# please see PR ports/121930.
#
# Starting with version 1.0-7667, NVidia has dropped support for numerous
# "legacy" GPUs.  Consult NVidia README (the Appendix) to find out whether
# you need to use legacy driver version and install one of corresponding
# `x11/nvidia-driver-71', `x11/nvidia-driver-96', `x11/nvidia-driver-173',
# or `x11/nvidia-driver-304' slave ports.

PORTNAME=	nvidia-driver
DISTVERSION?=	310.32
# Always try to set PORTREVISION as can be overridden by the slave ports
PORTREVISION?=	0
CATEGORIES=	x11 kld
MASTER_SITES=	${MASTER_SITE_NVIDIA}
# MASTER_SITE_SUBDIR has to be set later because it depends on NVVERSION
DISTNAME=	NVIDIA-FreeBSD-x86${ARCH_SUFX}-${DISTVERSION}

MAINTAINER=	danfe@FreeBSD.org
COMMENT=	NVidia graphics card binary drivers for hardware OpenGL rendering

LICENSE=	NVIDIA
LICENSE_NAME=	License For Customer Use of NVIDIA Software
LICENSE_FILE=	${WRKSRC}/doc/license.txt
LICENSE_PERMS=	dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept

ARCH_SUFX=	${ARCH:S/i386//:S/amd/_/}
USE_XORG=	xorg-server
USE_GL=		gl
USE_LDCONFIG=	yes

# NVIDIA_ROOT is not set in src/Makefile, which results in bogus -I/src
# passed to compiler and broken build on HEAD since r221320 when option
# -Wmissing-include-dirs was added for kernel sources.  Until properly
# fixed upstream (across all versions, including legacy ones), use this
# hack below to universally set NVIDIA_ROOT.  Also provide X11BASE value
# since it is going away from `Mk/bsd.port.mk' as deprecated.
MAKE_ENV=	NVIDIA_ROOT=${WRKSRC} X11BASE=${LOCALBASE}
SUB_FILES=	pkg-deinstall pkg-install pkg-message
DOCSDIR=	${PREFIX}/share/doc/NVIDIA_GLX-1.0
MODULESDIR=	lib/xorg/modules
PORTDOCS=	*

.if ${DISTVERSION:C/[0-9]+//g} == ".."		# major.minor.update
NVVERSION=	${DISTVERSION:S/.//g}
.else						# major.minor
NVVERSION=	${DISTVERSION:S/.//g}00
.endif

.if ${NVVERSION} >= 1952200
MASTER_SITE_SUBDIR=	XFree86/FreeBSD-x86${ARCH_SUFX}/${DISTVERSION}
ONLY_FOR_ARCHS=	i386 amd64
.else
MASTER_SITE_SUBDIR=	freebsd/${DISTVERSION}
ONLY_FOR_ARCHS=	i386
.endif

.if ${NVVERSION} <= 1904200
EXTRA_PATCHES=	${FILESDIR}/legacy-patch-nvidia.lib.mk
.endif

# Fix recent arbitrary memory access vulnerability in legacy drivers
.if ${NVVERSION} <= 1905300
. if ${NVVERSION} != 1731435
EXTRA_PATCHES+=	${FILESDIR}/security-patch-CVE-2012-0946
. endif
EXTRA_PATCHES+=	${FILESDIR}/security-patch-CVE-2012-4225
.endif

OPTIONS_DEFINE=	FREEBSD_AGP ACPI_PM LINUX DOCS
OPTIONS_DEFAULT=	LINUX

FREEBSD_AGP_DESC=	Use FreeBSD AGP GART driver
ACPI_PM_DESC=		ACPI Power Management support
LINUX_DESC=		Linux compatibility support

.if ${NVVERSION} >= 1952200
OPTIONS_DEFINE+=	WBINVD
WBINVD_DESC=		Flush CPU caches directly with WBINVD
.endif

.include <bsd.port.pre.mk>

PLIST_SUB+=	LINUXBASE=${LINUXBASE} SHLIB_VERSION=${PORTVERSION} \
		MODULESDIR=${MODULESDIR}
. if ${OSVERSION} > 1000028
EXTRA_PATCHES+=	${FILESDIR}/r248084-patch-src-nv-freebsd.h
EXTRA_PATCHES+=	${FILESDIR}/r248084-patch-src-nvidia_subr.c
. endif

.if ${PORT_OPTIONS:MLINUX}
CONFLICTS=	linux[-_]dri-[0-9]* linux-f10-dri-[0-9]*
USE_LINUX=	yes
PLIST_SUB+=	LINUX=""
. if ${OSVERSION} > 1000026
EXTRA_PATCHES+=	${FILESDIR}/r246085-patch-src-nvidia_linux.c
. endif
.else
PLIST_SUB+=	LINUX="@comment "
# Propagate WITHOUT_LINUX variable down to inner Makefiles
MAKE_ENV+=	WITHOUT_LINUX=yes
.endif

.if ${OSVERSION} < 702106 && ${NVVERSION} >= 1952200
IGNORE=		requires fairly recent FreeBSD-STABLE, or FreeBSD-CURRENT
.endif

.if ${NVVERSION} < 1952200
LIB_DEPENDS=	m.3:${PORTSDIR}/misc/compat5x
.endif

post-patch: .SILENT
# We should support -CURRENT: kill the check
	${REINPLACE_CMD} -e '24,26d' ${WRKSRC}/src/nv-freebsd.h
# Adjust legacy drivers for updated d_mmap() since early 9.X
.if ${OSVERSION} > 900005 && ${NVVERSION} < 1952200
	${REINPLACE_CMD} -e 's/vm_offset_t offset/vm_ooffset_t offset/ ; \
		s/vm_offset_t \*address/vm_paddr_t *address/ ; \
		s/int nprot/&, vm_memattr_t *memattr/' \
			${WRKSRC}/src/nvidia_dev.c
.endif
# Catch up legacy drivers with FreeBSD src SVN r225617
.if ${OSVERSION} > 900043 && ${NVVERSION} < 1952200
	${REINPLACE_CMD} -e '/return/s/ioctl/sys_&/' \
		${WRKSRC}/src/nvidia_linux.c
.endif
# Process OPTIONS
.if ${PORT_OPTIONS:MFREEBSD_AGP}
	${REINPLACE_CMD} -E 's/undef (NV_SUPPORT_OS_AGP)/define \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if ${PORT_OPTIONS:MACPI_PM}
	${REINPLACE_CMD} -E 's/undef (NV_SUPPORT_ACPI_PM)/define \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if ! ${PORT_OPTIONS:MLINUX}
	${REINPLACE_CMD} -E 's/define (NV_SUPPORT_LINUX_COMPAT)/undef \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if ${PORT_OPTIONS:MWBINVD}
	${REINPLACE_CMD} -E 's/undef (NV_USE_WBINVD)/define \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
	${REINPLACE_CMD} -e '/exists/s/$$/ \&\& !defined(WITHOUT_LINUX)/' \
		${WRKSRC}/lib/Makefile
# Do not install VDPAU libraries which are provided by `multimedia/libvdpau'
# port for a while now
.if ${NVVERSION} >= 1802900
	${REINPLACE_CMD} -e '/libvdpau[[:blank:]_][^n]/d ; \
		s/name libvdpau/&_nvidia/' ${WRKSRC}/lib/Makefile
.endif
# Do not build any binaries (native nvidia-settings and nvidia-xconfig are
# provided by corresponding ports) and manual pages
.if ${NVVERSION} < 974600 || ${NVVERSION} >= 1952200
	${REINPLACE_CMD} -E 's/(extension).*/\1/' ${WRKSRC}/x11/Makefile
.else
	${REINPLACE_CMD} -E 's/(lib).*/\1/' ${WRKSRC}/x11/Makefile
.endif
	${REINPLACE_CMD} -e '/bin/d ; /man/d' ${WRKSRC}/x11/Makefile
# Conditionally install documentation (but you generally want it)
.if ! ${PORT_OPTIONS:MDOCS}
	${REINPLACE_CMD} -E 's/(x11).*/\1/ ; /doc/d' ${WRKSRC}/Makefile
.endif
# Adjust installation paths of some conflicting files (shared also between
# libGL and xorg-server) to ease package manager work, esp. with pkgng
	${REINPLACE_CMD} -e '/LIBDIR/s:xorg/modules/extensions:&/.nvidia:' \
		${WRKSRC}/x11/extension/Makefile
	${REINPLACE_CMD} -e '/LIBDIR/s:lib:&/.nvidia:' \
		${WRKSRC}/lib/libGL/Makefile
# Do not execute afterinstall target (prevent automatic module registration
# and "smart" installation of conflicting files heuristics)
	${REINPLACE_CMD} -e 's/afterinstall/dontexecute/' ${WRKSRC}/Makefile
	${REINPLACE_CMD} -e 's/beforeinstall/dontexecute/' \
		${WRKSRC}/lib/Makefile ${WRKSRC}/src/Makefile

pre-su-install:
# While this port silently assumes PREFIX == LOCALBASE, at least try to
# pretend we support different paths thereof and make sure these directories
# exist
	@cd ${PREFIX}/${MODULESDIR} && ${MKDIR} drivers extensions

post-install: .SILENT
# pkg-plist is already overbloated, so use these hacks instead of PLIST_SUB's
.if ${NVVERSION} < 817400
	${REINPLACE_CMD} -e '/libnvidia-cfg/d' ${TMPPLIST}
.endif
.if ${NVVERSION} < 974600 || ${NVVERSION} >= 1952200
	${REINPLACE_CMD} -e '/wfb/d' ${TMPPLIST}
.endif
.if ${NVVERSION} < 1802900
	${REINPLACE_CMD} -e '/vdpau/d' ${TMPPLIST}
.endif
.if ${NVVERSION} < 1851829
	${REINPLACE_CMD} -e '/libcuda/d' ${TMPPLIST}
.endif
.if ${NVVERSION} >= 2565300
	${REINPLACE_CMD} -E 's/libGLcore/libnvidia-glcore/ ; \
		/usr.*(glcore|tls).*so\.1$$/d' ${TMPPLIST}
.endif
.if ${NVVERSION} >= 3101900
	${REINPLACE_CMD} -e '/libXvMCNVIDIA/d' ${TMPPLIST}
.else	# some applications need this symlink (see PR ports/72877)
	${LN} -sf libXvMCNVIDIA.so.1 ${PREFIX}/lib/libXvMCNVIDIA_dynamic.so.1
.endif
.if ${NVVERSION} >= 1952200
. if ${OSVERSION} > 800090
	${REINPLACE_CMD} -e '/does not support PAE/,+1d' ${PKGMESSAGE}
. else	# when sed(1) does not support "addr1,+N" ranges, use line numbers
	${REINPLACE_CMD} -e '26,27d' ${PKGMESSAGE}
. endif
.endif
	PKG_PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
	${ECHO_MSG}
	${CAT} ${PKGMESSAGE}
	${ECHO_MSG}

.include <bsd.port.post.mk>
