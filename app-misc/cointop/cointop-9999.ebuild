# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/miguelmota/${PN}"
EGIT_REPO_URI="https://${EGO_PN}.git"

inherit git-r3 go-module

DESCRIPTION="Interactive cryptocurrency monitor"
HOMEPAGE="https://github.com/miguelmota/cointop"
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""
IUSE=""

src_unpack() {
	git-r3_src_unpack
}

src_compile() {
	export -n GOCACHE XDG_CACHE_HOME
	go build -o bin/cointop main.go || die "build failed"
}

src_test() {
	go test -work ./... || die "test failed"
}

src_install() {
	einstalldocs
	dobin bin/cointop
}
