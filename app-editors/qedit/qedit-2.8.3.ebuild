# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils desktop xdg-utils

DESCRIPTION="Qt-based multi-purpose text editor"
HOMEPAGE="http://hugo.pereira.free.fr/software/index.php"
SRC_URI="http://hugo.pereira.free.fr/software/tgz/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="aspell"

RDEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5[xcb]
	dev-qt/qtwidgets:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtxml:5
	aspell? ( app-text/aspell )"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	default

	if ! use aspell ; then
		sed -i  -e '/find_program(ASPELL/d' \
			-e '/find_package(ASPELL/d' \
			CMakeLists.txt || die "sed failed for CMakeLists.txt"
	fi
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		"-DUSE_QT5=1"
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	domenu qedit.desktop
	doicon qedit.png
	doicon -s 128 qedit.png
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}