# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Firmware files for the Pinebook Pro that are not included in linux-firmware"
HOMEPAGE="https://gitlab.manjaro.org/manjaro-arm/packages/community/ap6256-firmware"
EGIT_REPO_URI="https://gitlab.manjaro.org/manjaro-arm/packages/community/ap6256-firmware.git"
EGIT_COMMIT="007c6dd132263624db9ea6ce8dde4fc2108f21b7"

LICENSE="Broadcom"
SLOT="0"
KEYWORDS="~arm64"

src_prepare() {
	rm PKGBUILD || die
	mkdir brcm || die

	cp BCM4345C5.hcd brcm/BCM.hcd || die
	cp BCM4345C5.hcd brcm/BCM4345C5.hcd || die

	cp nvram_ap6256.txt brcm/brcmfmac43456-sdio.pine64,pinebook-pro.txt || die

	mv fw_bcm43456c5_ag.bin brcm/brcmfmac43456-sdio.bin || die

	mv brcmfmac43456-sdio.clm_blob brcm/brcmfmac43456-sdio.clm_blob || die

	default
}

src_install() {
	insinto /lib/firmware
	doins -r *
}
