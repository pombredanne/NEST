# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools findlib

DESCRIPTION="OCaml daemon tools library"
HOMEPAGE="https://github.com/savonet/ocaml-dtools"
SRC_URI="https://github.com/savonet/${PN}/releases/download/${PV}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+camlp4 debug +ocamlopt profiling syslog"
RDEPEND="dev-lang/ocaml:=[ocamlopt?]
	camlp4? ( dev-ml/camlp4:= )
	syslog? ( dev-ml/ocaml-syslog:= )"
DEPEND="${RDEPEND}
	dev-ml/findlib"
DOCS=( CHANGES README )

src_prepare() {
	default

	sed -i 's/AC_CHECK_TOOL_STRICT/AC_CHECK_TOOL/g' m4/ocaml.m4 \
		|| die "Failed editing m4/ocaml.m4!"
	AT_M4DIR="m4" eautoreconf
}

src_configure() {
	econf "$(use_enable camlp4)" \
		"$(use_enable debug debugging)" \
		"$(use_enable ocamlopt nativecode)" \
		"$(use_enable profiling)" \
		"$(use_enable syslog)"
}

src_install() {
	findlib_src_install
	einstalldocs
}
