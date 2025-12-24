# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop toolchain-funcs xdg

DESCRIPTION="A teletext page editor"
HOMEPAGE="https://github.com/peterkvt80/wxted"

if [[ "${PV}" = *9999* ]] ; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/peterkvt80/${PN}"
else
	SRC_URI="https://github.com/peterkvt80/wxted/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${P}"
	KEYWORDS="~amd64 ~x86"
fi

SLOT="0"

DEPEND="
	x11-libs/wxGTK[X]
"
RDEPEND="${DEPEND}
        media-fonts/teletext-ttf
"

PATCHES=(
	"${FILESDIR}"/wxted-1.58-memory.patch
)

src_compile() {
	$(tc-getCXX) ${CPPFLAGS} ${LDFLAGS} -o wxTED \
		-I./include \
		charchange.cpp \
		hamm.c \
		HelpFrame.cpp \
		mapchar.cpp \
		PageSettingsDialog.cpp \
		PaletteFrame.cpp \
		PublishSetupDialog.cpp \
		tedevent.cpp \
		teletext40.cpp \
		ttxline.cpp \
		ttxpage.cpp \
		ttxrow28.cpp \
		wxTEDApp.cpp \
		wxTEDMain.cpp \
		src/T42.cpp \
		src/HeaderPacket.cpp \
		`wx-config --cxxflags --libs core,base,adv,html` \
		-std=c++17 || die
}

src_install() {
	dobin wxTED
	einstalldocs
	into /usr
	domenu "${FILESDIR}"/wxted.desktop
}
