# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/olegantonyan/${PN}.git"

inherit git-r3 qmake-utils xdg

DESCRIPTION="Music player for big local collections"
HOMEPAGE="https://olegantonyan.github.io/mpz"
SRC_URI="https://github.com/olegantonyan/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtmultimedia:5
	dev-qt/qtwidgets:5
	dev-qt/qtx11extras:5"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake5
}

src_install() {
	einstalldocs
	emake INSTALL_ROOT="${ED}" install
}
