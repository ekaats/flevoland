EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="Collect your thoughts and notes without leaving the command line"
HOMEPAGE="jrnl.sh"
SRC_URI="https://github.com/jrnl-org/jrnl/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

PATCHES="
	${FILESDIR}/tomli.patch
	${FILESDIR}/test_fixes.patch
"
DEPEND="
	dev-python/rich
	dev-python/colorama
	dev-python/cryptography
	dev-python/keyring
	dev-python/parsedatetime
	dev-python/python-dateutil
	dev-python/xdg
	dev-python/ruamel-yaml
	dev-python/tzlocal
	test? (
		dev-python/pytest
		dev-python/pytest-bdd
		dev-python/pytest-clarity
		dev-python/pytest-xdist
		dev-python/tomli
		)
"
RDEPEND="${DEPEND}"
BDEPEND=""
distutils_enable_tests pytest
