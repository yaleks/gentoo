# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: Exp $

EAPI="5"

PLOCALES="cs fr ru"
inherit cmake-utils l10n git-2

DESCRIPTION="Boomaga provides a post-processing backend and virtual printer for CUPS."
HOMEPAGE="https://github.com/Boomaga/boomaga"
EGIT_REPO_URI="https://github.com/Boomaga/boomaga.git"

LICENSE="LGPL-2.1 GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-qt/qtgui
	net-print/cups
	app-text/ghostscript-gpl
	app-arch/snappy"
RDEPEND="${DEPEND}"

DOCS="README.md"

src_prepare() {
	l10n_find_plocales_changes "gui/translations" "${PN}_" '.ts'

	epatch_user
}

src_install() {
	remove_translation() {
		rm "${ED}/usr/share/${PN}/translations/${PN}_${1}.qm" || die "remove '${PN}_${1}.qm' file failed"
	}
	cmake-utils_src_install
	l10n_for_each_disabled_locale_do remove_translation
}
pkg_postinst() {
	elog "You will need to set up your Virtual printer file before"
	elog "running Boomaga for the first time."
	elog "lpadmin -h localhost -p Boomaga_Printer -v boomaga:/ -E \
	-m /usr/share/ppd/boomaga/boomaga.ppd -o printer-is-shared=no -o PageSize=a4"
}
