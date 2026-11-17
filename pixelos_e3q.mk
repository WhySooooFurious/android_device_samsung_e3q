#
# Copyright (C) 2026 The PixelOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The base derives ro.custom.device from the device name in
# gen_build_prop, and vendor/custom/config/version.mk adds the
# same property from $(CUSTOM_BUILD), which envsetup only sets
# for products named custom_*. Duplicate assignments with
# different values fail post_process_props, so define it here
# to match the derived value.
CUSTOM_BUILD := e3q

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
