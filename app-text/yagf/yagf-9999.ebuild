# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-text/yagf/yagf-0.8.7.ebuild,v 1.2 2011/09/12 13:18:16 pva Exp $

EAPI=4
inherit cmake-utils subversion

DESCRIPTION="Graphical front-end for cuneiform and tesseract OCR tools"
HOMEPAGE="http://symmetrica.net/cuneiform-linux/yagf-en.html"
ESVN_REPO_URI="http://yagf.googlecode.com/svn/trunk"
ESVN_PROJECT="yagf-read-only"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="scanner +cuneiform tesseract pdf"

REQUIRED_USE="|| ( cuneiform tesseract )"

DEPEND="x11-libs/qt-gui
	app-text/aspell"
RDEPEND="${DEPEND}
	cuneiform? ( app-text/cuneiform )
	tesseract? ( app-text/tesseract )
	scanner? ( media-gfx/xsane )
	pdf? ( || ( app-text/poppler[utils] app-text/ghostscript-gpl ) )"

DOCS="AUTHORS ChangeLog DESCRIPTION README"

CMAKE_IN_SOURCE_BUILD=1
