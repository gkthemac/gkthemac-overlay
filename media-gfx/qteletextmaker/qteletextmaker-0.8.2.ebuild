# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="A teletext page editor"
HOMEPAGE="https://github.com/gkthemac/QTeletextMaker"

MY_PN="QTeletextMaker"
MY_PV="${PV}-beta"
MY_P="${MY_PN}-${MY_PV}"

if [[ "${PV}" = *9999* ]] ; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/gkthemac/${MY_PN}"
else
	SRC_URI="https://github.com/gkthemac/QTeletextMaker/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${MY_P}"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-qt/qtbase:6[gui,widgets]
"
RDEPEND="${DEPEND}"

src_install() {
	cmake_src_install
	docompress -x /usr/share/doc/${PF}/examples
}
