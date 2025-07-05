#
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=Material 3 Theme
LUCI_DEPENDS:=+luci-base
PKG_VERSION:=1.3.0
PKG_RELEASE:=20250703

PKG_LICENSE:=Apache-2.0

define Package/luci-theme-material3/postrm
[ -n "$${IPKG_INSTROOT}" ] || {
	uci -q delete luci.themes.Material3
	uci -q delete luci.themes.Material3Blue
	uci -q delete luci.themes.Material3Green
	uci -q delete luci.themes.Material3Red
	uci -q delete luci.themes.Material3Amoled
	uci set luci.main.mediaurlbase='/luci-static/bootstrap'
	# uci -q delete luci.themes.Material3Dark
	# uci -q delete luci.themes.Material3Light
	uci commit luci

	# Make sure Google Sans cache doesn't prevent a complete removal
	rm -rf /www/luci-static/material3
}
endef

CONFIG_LUCI_CSSTIDY:=

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
