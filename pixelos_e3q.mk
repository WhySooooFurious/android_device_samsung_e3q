#
# Copyright (C) 2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/samsung/e3q/device.mk)

# Inherit from the PixelOS configuration.
$(call inherit-product, vendor/custom/config/common_full_phone.mk)

PRODUCT_NAME := pixelos_e3q
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S928B
PRODUCT_MANUFACTURER := Samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# PixelOS branding (vendor/custom/config/version.mk)
CUSTOM_BUILD := e3q
ROM_FINGERPRINT := samsung/pixelos_e3q/e3q:16/PixelOS_e3q/16.0-20260928-UNOFFICIAL-e3q:userdebug/release-keys

# PixelOS EPPE wildcard check expects device/*/$(CUSTOM_BUILD)/ layout; skip it.
TARGET_DISABLE_EPPE := true
