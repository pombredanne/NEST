# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 )
WEBAPP_MANUAL_SLOT="yes"

inherit python-r1 webapp user

DESCRIPTION="IP address management (IPAM) and data center infrastructure management (DCIM)"
HOMEPAGE="https://github.com/digitalocean/netbox"
SRC_URI="https://github.com/digitalocean/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="vhosts"

RDEPEND="dev-python/django[${PYTHON_USEDEP}]
	dev-python/drf-yasg[${PYTHON_USEDEP}]
	dev-python/django-rest-framework[${PYTHON_USEDEP}]
	dev-python/django-filter[${PYTHON_USEDEP}]
	dev-python/django-timezone-field[${PYTHON_USEDEP}]
	dev-python/django-taggit[${PYTHON_USEDEP}]
	dev-python/django-cors-headers[${PYTHON_USEDEP}]
	dev-python/django-debug-toolbar[${PYTHON_USEDEP}]
	dev-python/django-mptt[${PYTHON_USEDEP}]
	dev-python/django-tables2[${PYTHON_USEDEP}]
	dev-python/graphviz[${PYTHON_USEDEP}]
	dev-python/markdown[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]
	dev-python/netaddr[${PYTHON_USEDEP}]
	dev-python/ncclient[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/psycopg:2[${PYTHON_USEDEP}]
	dev-python/py-gfm[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]"

DOCS=( README.md CONTRIBUTING.md )

pkg_setup() {
	python_setup
	webapp_pkg_setup

	enewgroup netbox
	enewuser netbox -1 -1 /dev/null/netbox netbox
}

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r netbox/*

	exeinto "${MY_HTDOCSDIR}"
	doexe netbox/generate_secret_key.py
	doexe netbox/manage.py

	webapp_src_install
}

pkg_postinst() {
	elog "You may need to add your web-server user to netbox group"
	elog "---"

	webapp_pkg_postinst
}

pkg_config() {
	einfo "Enter you vhost_root/vhost_htdocs. Default: localhost/htdocs"
	read -r answer
	[ -z "${answer}" ] && answer="localhost/htdocs"
	path="${ROOT}"var/www/"${answer}"/netbox
	unset answer

	if [ -f "${path}/netbox/configuration.py" ] ; then
		einfo "Applies database migrations from ${path} ?"
		einfo
		while [ "$correct" != "true" ] ; do
			einfo "Are you ready to continue? (y/n)"
			read -r answer
			if [[ "$answer" =~ ^[Yy]([Ee][Ss])?$ ]] ; then
				correct="true"
			elif [[ "$answer" =~ ^[Nn]([Oo])?$ ]] ; then
				die "Aborting migration."
			else
				echo "Answer not recognized"
			fi
		done
		# Apply database migrations
		"${path}"/manage.py migrate
	fi

	if [ ! -d "${path}/static" ] ; then
		# Collect static files
		"${path}"/manage.py collectstatic

		chown -R netbox:netbox "${path}"/static
	else
		einfo "Not managing static files since ${path}/static exists"
	fi
}