# Copyright 2023 dearfl
# Distributed under the terms of the WTFPL License

EAPI=8

inherit desktop xdg

DESCRIPTION="Visualizer for neural network, deep learning, and mechine learning models."
HOMEPAGE="https://netron.app"
SRC_URI="
	amd64? ( https://github.com/lutzroeder/netron/releases/download/v${PV}/Netron-${PV}.AppImage )
"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"

RESTRICT="strip"

BDEPEND="sys-fs/fuse:0"

S="${WORKDIR}"
QA_PREBUILT="*"

src_install() {
	cp "${DISTDIR}/Netron-${PV}.AppImage" netron || die
	into /opt/
	dobin netron
}
