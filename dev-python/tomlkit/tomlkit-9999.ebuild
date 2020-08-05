# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DISTUTILS_USE_SETUPTOOLS=pyproject.toml
PYTHON_COMPAT=( python3_{6..8} )
EGIT_REPO_URI="https://github.com/sdispater/${PN}.git"
EGIT_SUBMODULES=( tests/toml-test )

inherit distutils-r1 git-r3

DESCRIPTION="Style-preserving TOML library for Python"
HOMEPAGE="https://github.com/sdispater/tomlkit"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test"

distutils_enable_tests pytest

python_prepare_all() {
	# Fix backend specification
	sed -i '/build-backend/s/poetry.core.masonry.api/poetry.masonry.api/' \
		pyproject.toml || die "sed failed for pyproject.toml"

	distutils-r1_python_prepare_all
}
