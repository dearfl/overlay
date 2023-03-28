# Copyright 2023 dearfl
# Distributed under the terms of the WTFPL License

EAPI=8
inherit savedconfig git-r3

DESCRIPTION="Suckless Status Tool"
HOMEPAGE="https://tools.suckless.org/slstatus/"
EGIT_REPO_URI="https://git.suckless.org/slstatus"

LICENSE="ISC"
SLOT="0"
KEYWORDS=""
IUSE="savedconfig"

RDEPEND="
	x11-libs/libX11
	x11-libs/libXft
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
	x11-base/xorg-proto
"

src_prepare() {
	default
	restore_config config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
	dodoc README
	save_config config.h
}

pkg_postinst() {
	elog "Check ${HOMEPAGE} for more Details"
}
