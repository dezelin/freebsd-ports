# Created by:	Tomoyuki Sakurai <cherry@trombik.mine.nu>
# $FreeBSD$

PORTNAME=	puppet
PORTVERSION=	3.1.1
PORTREVISION=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://downloads.puppetlabs.com/puppet/

MAINTAINER=	swills@FreeBSD.org
COMMENT=	A configuration management framework written in Ruby

RUN_DEPENDS=	rubygem-facter>=0:${PORTSDIR}/sysutils/rubygem-facter \
		rubygem-ruby-augeas>=0:${PORTSDIR}/textproc/rubygem-augeas \
		rubygem-hiera>=0:${PORTSDIR}/sysutils/rubygem-hiera

CONFLICTS=      puppet-2*
NO_BUILD=	yes
USE_RUBY=	yes
USE_RUBY_FEATURES=	iconv
USE_RC_SUBR=	puppet puppetmaster
PORTDOCS=	LICENSE README.md
PORTEXAMPLES=	*
USERS=		puppet
GROUPS=		puppet
SUB_FILES+=	pkg-message
SUB_LIST=	RUBY=${RUBY}

MANCOMPRESSED=	yes
MAN5=	puppet.conf.5
MAN8=	extlookup2hiera.8 puppet-agent.8 puppet-apply.8 puppet-ca.8 \
	puppet-catalog.8 puppet-cert.8 puppet-certificate.8 \
	puppet-certificate_request.8 puppet-certificate_revocation_list.8 \
	puppet-config.8 puppet-describe.8 puppet-device.8 puppet-doc.8 \
	puppet-facts.8 puppet-file.8 puppet-filebucket.8 puppet-help.8 \
	puppet-inspect.8 puppet-instrumentation_data.8 \
	puppet-instrumentation_listener.8 puppet-instrumentation_probe.8 \
	puppet-key.8 puppet-kick.8 puppet-man.8 puppet-master.8 \
	puppet-module.8 puppet-node.8 puppet-parser.8 puppet-plugin.8 \
	puppet-queue.8 puppet-report.8 puppet-resource.8 \
	puppet-resource_type.8 puppet-secret_agent.8 puppet-status.8 \
	puppet.8

OPTIONS_DEFINE=		MONGREL PACKAGE_ORIGIN PACKAGE_ROOT
OPTIONS_DEFAULT=	PACKAGE_ORIGIN
MONGREL_DESC=		Run puppet server as a mongrel service
PACKAGE_ORIGIN_DESC=	Use port origin as package name
PACKAGE_ROOT_DESC=	Use PACKAGEROOT insted of PACKAGESITE

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MMONGREL}
RUN_DEPENDS+=	rubygem-mongrel>=0:${PORTSDIR}/www/rubygem-mongrel
.endif

.if ${PORT_OPTIONS:MPACKAGE_ORIGIN}
EXTRA_PATCHES+=	${FILESDIR}/optpatch-package_origin
RUN_DEPENDS+=	rubygem-bzip2>=0:${PORTSDIR}/archivers/rubygem-bzip2
.endif

.if ${PORT_OPTIONS:MPACKAGE_ROOT}
.if ! ${PORT_OPTIONS:MPACKAGE_ORIGIN}
EXTRA_PATCHES+=	${FILESDIR}/optpatch-package_root
.else
BROKEN=	PACKAGE_ROOT option patch is incompatable with PACKAGE_ORIGIN patch.
.endif
.endif

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e "s|/etc/puppet|${ETCDIR}|" \
		${WRKSRC}/install.rb \
		${WRKSRC}/lib/puppet/reference/configuration.rb \
		${WRKSRC}/lib/puppet/defaults.rb \
		${WRKSRC}/lib/puppet/util/run_mode.rb
	@${REINPLACE_CMD} -e "s|/var/lib/puppet|/var/puppet|" \
		${WRKSRC}/lib/puppet/reference/configuration.rb \
		${WRKSRC}/lib/puppet/util/run_mode.rb
	@${REINPLACE_CMD} -e "s|\$$vardir/run|/var/run/puppet|" \
		${WRKSRC}/lib/puppet/util/run_mode.rb
	@${REINPLACE_CMD} -e "s|\$$confdir/ssl|/var/puppet/ssl|" \
		${WRKSRC}/lib/puppet/defaults.rb

do-install:
	@cd ${WRKSRC} && ${SETENV} PREFIX=${PREFIX} ${RUBY} ${WRKSRC}/install.rb --no-configs

post-install:
	${INSTALL} -d ${ETCDIR}
	${INSTALL} -m 0755 -o puppet -g puppet -d /var/puppet
	${INSTALL} -m 0644 ${WRKSRC}/conf/auth.conf ${ETCDIR}/auth.conf-dist
	${RUBY} -I ${RUBY_SITELIBDIR} ${PREFIX}/bin/puppet master --genconfig \
		--confdir=${ETCDIR} \
		--rundir=/var/run/puppet \
		--vardir=/var/lib/puppet \
		--logdir=/var/log/puppet \
		> ${ETCDIR}/puppet.conf-dist
	@${ECHO} ${RUBY_SITELIBDIR}/puppet.rb | \
		${SED} 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${ECHO} ${RUBY_SITELIBDIR}/semver.rb | \
		${SED} 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} ${RUBY_SITELIBDIR}/${PORTNAME} -type f | \
		${SED} 's,^${PREFIX}/,,' >> ${TMPPLIST}
	@${FIND} ${RUBY_SITELIBDIR}/${PORTNAME} -type d | ${SORT} -r | \
		${SED} 's,^${PREFIX}/,@dirrm ,' >> ${TMPPLIST}
.if ${PORT_OPTIONS:MDOCS}
	${INSTALL} -d ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR}
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${EXAMPLESDIR}
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
