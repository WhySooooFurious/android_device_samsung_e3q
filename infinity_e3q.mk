#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Force this ROM to be debuggable + unsecured-ADB at boot.
# The A17 base hardcodes TARGET_BUILD_TYPE=release in _lunch_meat, so
# gen_build_prop treats every non-eng build as a plain 'user' build:
# the system partition gets ro.build.type=user, ro.debuggable=0,
# ro.adb.secure=1. init loads partition build.props in the order
# system -> system_ext -> system_dlkm -> vendor -> vendor_dlkm ->
# odm -> product, so product is the LAST word at runtime. These
# product-partition overrides therefore win over the base.
# WITH_ADB_INSECURE also makes the base set system_ext ro.adb.secure=0
# instead of 1 (vendor/infinity/config/common.mk).
# NOTE: do not add ro.build.type here - gen_build_prop emits
# ro.build.type for every partition, which would duplicate it in the
# product partition and fail the build (duplicate sysprop).
WITH_ADB_INSECURE := 1
PRODUCT_PRODUCT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.debuggable=1

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/samsung/e3q/device.mk)
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

PRODUCT_NAME := infinity_e3q
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S928B
PRODUCT_MANUFACTURER := Samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung
