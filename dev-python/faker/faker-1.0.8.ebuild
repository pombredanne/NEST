# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_{5..7}} )

inherit distutils-r1

DESCRIPTION="Python package that generates fake data"
HOMEPAGE="https://github.com/joke2k/faker"
SRC_URI="https://github.com/joke2k/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/text-unidecode[${PYTHON_USEDEP}]
	virtual/python-ipaddress[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/pytest-runner[${PYTHON_USEDEP}]
	test? ( dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/random2[${PYTHON_USEDEP}]
		dev-python/ukpostcodeparser[${PYTHON_USEDEP}]
		dev-python/validators[${PYTHON_USEDEP}]
		virtual/python-unittest-mock[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/more-itertools[${PYTHON_USEDEP}]' '-2') )"

python_test() {
	py.test -v || die "tests failed with ${EPYTHON}"
}