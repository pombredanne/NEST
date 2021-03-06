# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/sigmavirus24/${PN}.git"

inherit git-r3 toolchain-funcs

DESCRIPTION="X11-based passphrase dialog for use with OpenSSH"
HOMEPAGE="https://github.com/sigmavirus24/x11-ssh-askpass"
SRC_URI=""

LICENSE="HPND"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/ssh
	x11-libs/libICE
	x11-libs/libSM
	x11-libs/libX11
	x11-libs/libXt"
DEPEND="${RDEPEND}"
BDEPEND="app-text/rman
	x11-misc/imake"

src_configure() {
	econf --libexecdir=/usr/"$(get_libdir)"/misc \
		--disable-installing-app-defaults
	xmkmf || die "xmkmf failed"
}

src_compile() {
	emake includes
	emake CC="$(tc-getCC)" CDEBUGFLAGS="${CFLAGS}"
}

src_install() {
	default
	newman x11-ssh-askpass.man x11-ssh-askpass.1
	dosym ../"$(get_libdir)"/misc/x11-ssh-askpass /usr/bin/x11-ssh-askpass
}
