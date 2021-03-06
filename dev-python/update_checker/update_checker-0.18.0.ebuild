# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="A python module that will check for package updates"
HOMEPAGE="https://github.com/bboe/update_checker"
SRC_URI="https://github.com/bboe/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
