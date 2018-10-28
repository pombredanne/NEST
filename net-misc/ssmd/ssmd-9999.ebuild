# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="http://git.stg.codes/${PN}.git"

inherit git-r3 systemd toolchain-funcs user

DESCRIPTION="SNMP Switch Management Daemon"
HOMEPAGE="http://stg.codes/projects/ssmd"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug libressl"

DEPEND="dev-libs/boost:0=
	net-misc/curl
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup ssmd
	enewuser ssmd -1 -1 /etc/ssmd ssmd
}

src_compile() {
	emake CXX="$(tc-getCXX)" "$(usex debug BUILD=Debug BUILD=Release)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${D}" install

	newinitd "${FILESDIR}"/ssmd.initd ssmd
	newconfd "${FILESDIR}"/ssmd.conf ssmd
	systemd_dounit "${FILESDIR}"/ssmd.service

	fowners -R ssmd:ssmd /etc/ssmd/
	fperms 0640 /etc/ssmd/ssmd.conf
}

pkg_postinst() {
	einfo " Data URL format:\\n"
	einfo " <switch ip>,<snmp v2c read community>,<snmp v2c write community>,<switch uplink port>,"
	einfo " <subscriber port>,<subscriber MAC address>,<subscriber download speed>,<subscriber upload speed>,"
	einfo " <subscriber download speed burst>,<subscriber upload speed burst>\\n"
	einfo " Example:\\n"
	einfo " 10.90.90.90,public,private,26,1,0015f2816b7e,10240,10240,1016,1016\\n"
	einfo " Switch ACL profiles:\\n"
	einfo " create access_profile ethernet source_mac FF-FF-FF-FF-FF-FF profile_id N"
	einfo " create access_profile ethernet destination_mac FF-FF-FF-FF-FF-FF profile_id M\\n"
	einfo " In ssmd.conf up_profile_id is N, down_profile_id is M."
}