# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/lark-parser/lark.git"
PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1 git-r3

DESCRIPTION="A modern general-purpose parsing library for Python"
HOMEPAGE="https://github.com/lark-parser/lark"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
RESTRICT="test" # no files

BDEPEND="test? ( dev-python/js2py[${PYTHON_USEDEP}]
		dev-python/regex[${PYTHON_USEDEP}] )"

distutils_enable_tests unittest
