# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/Jimdo/${PN}"

inherit golang-build golang-vcs-snapshot

DESCRIPTION="Utility to import/export data from HashiCorp Vault"
HOMEPAGE="https://github.com/Jimdo/yaml-vault"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DOCS=( src/"${EGO_PN}"/{README,History}.md )

src_install() {
	einstalldocs
	dobin yaml-vault
}
