#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.242/g' package/base-files/files/bin/config_generate
# 修改默认主机名
sed -i '/uci commit system/i\uci set system.@system[0].hostname='Soft_Router'' package/lean/default-settings/files/zzz-default-settings
 
# 加入编译者信息
sed -i "s/OpenWrt /Kinoko-Galen build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings
 
# 修改默认主题
sed -i "s/luci-theme-bootstrap/luci-theme-argon/g" feeds/luci/collections/luci/Makefile

