# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Teletext truetype font"
HOMEPAGE="https://github.com/peterkvt80/wxted"
SRC_URI="https://github.com/peterkvt80/wxted/raw/refs/heads/master/font/teletext2.ttf https://github.com/peterkvt80/wxted/raw/refs/heads/master/font/teletext4.ttf"
S="${WORKDIR}"

SLOT="0"
KEYWORDS="~amd64 ~x86"

FONT_SUFFIX="ttf"

src_unpack() {
	cp "${DISTDIR}"/*.ttf . || die
}
