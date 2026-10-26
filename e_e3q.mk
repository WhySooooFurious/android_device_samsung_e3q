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

# Inherit from the /e/OS configuration.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)
$(call inherit-product, vendor/eos/config/common.mk)

PRODUCT_NAME := e_e3q
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S928B
PRODUCT_MANUFACTURER := Samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# The public product template ships no real signing keys, so empty the
# certificate overrides (apexes fall back to default certificates) and let
# the build sign with the AOSP testkey.
PRODUCT_CERTIFICATE_OVERRIDES :=

# The /e/OS base (vendor/lineage/config/common.mk) adds the Lineage framework
# compatibility matrix to every product. e3q's vendor image provides none of
# the Lineage HALs it references, which fails the boot-time VINTF check
# (stuck at boot logo), as the VoltageOS product in this tree does.
PRODUCT_PACKAGES := $(filter-out framework_compatibility_matrix.lineage.xml,$(PRODUCT_PACKAGES))
