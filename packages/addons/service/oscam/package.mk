# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="oscam"
PKG_VERSION="d462213eec758e84079adce0f55fcf6dc201b00b"
PKG_SHA256="aec60ad7c0ab0badbb0dcf5150aea514ea1c21d4cf73fcb646b0c42c2bdd69f5"
PKG_VERSION_NUMBER="11726"
PKG_REV="0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.streamboard.tv/oscam/wiki"
PKG_URL="https://repo.or.cz/oscam.git/snapshot/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain openssl pcsc-lite"
PKG_SECTION="service.softcam"
PKG_SHORTDESC="OSCam: an Open Source Conditional Access Modul"
PKG_LONGDESC="OSCam(${PKG_VERSION_NUMBER}) is a software to be used to decrypt digital television channels, as an alternative for a conditional access module."

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="OSCam"
PKG_ADDON_TYPE="xbmc.service"

PKG_CMAKE_OPTS_TARGET="\
  `#Building` \
  -DLIBUSBDIR=${SYSROOT_PREFIX}/usr \
  -DOPTIONAL_INCLUDE_DIR=${SYSROOT_PREFIX}/usr/include \
  \
  `#Readers` \
  -DCARDREADER_DB2COM=OFF \
  -DCARDREADER_DRECAS=ON \
  -DCARDREADER_INTERNAL=OFF \
  -DCARDREADER_MP35=ON \
  -DCARDREADER_PHOENIX=ON \
  -DCARDREADER_SC8IN1=ON \
  -DCARDREADER_SMARGO=ON \
  -DCARDREADER_STAPI5=OFF \
  -DCARDREADER_STAPI=OFF \
  -DCARDREADER_STINGER=ON \
  \
  `#Protocol` \
  -DMODULE_CAMD33=OFF \
  -DMODULE_CAMD35=ON \
  -DMODULE_CAMD35_TCP=ON \
  -DMODULE_CCCAM=ON \
  -DMODULE_CCCSHARE=ON \
  -DMODULE_CONSTCW=ON \
  -DMODULE_GBOX=ON \
  -DMODULE_GHTTP=ON \
  -DMODULE_NEWCAMD=ON \
  -DMODULE_PANDORA=ON \
  -DMODULE_RADEGAST=ON \
  -DMODULE_SCAM=ON \
  -DMODULE_SERIAL=ON \
  \
  `#Features` \
  -DCLOCKFIX=0 \
  -DCS_ANTICASC=ON \
  -DCS_CACHEEX=ON \
  -DCW_CYCLE_CHECK=ON \
  -DHAVE_DVBAPI=1 \
  -DHAVE_LIBCRYPTO=1 \
  -DSTATIC_LIBUSB=1 \
  -DTOUCH=ON \
  -DWEBIF=1 \
  -DWEBIF_LIVELOG=1 \
  -DWEBIF_JQUERY=1 \
  -DWITH_DEBUG=0 \
  -DWITH_SSL=1 \
  -DWITH_STAPI=0"

pre_configure_target() {
  export OSCAM_ADDON_VERSION="${PKG_VERSION_NUMBER}"
}

makeinstall_target() {
  :
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/oscam ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp -P ${PKG_BUILD}/.${TARGET_NAME}/utils/list_smargo ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
}
