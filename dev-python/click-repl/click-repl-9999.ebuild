# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
EGIT_REPO_URI="https://github.com/click-contrib/${PN}.git"

inherit distutils-r1 git-r3

DESCRIPTION="Subcommand REPL for click apps"
HOMEPAGE="https://github.com/click-contrib/click-repl"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

RDEPEND="dev-python/click[${PYTHON_USEDEP}]
	dev-python/prompt_toolkit[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
