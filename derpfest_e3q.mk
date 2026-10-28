#
# Copyright (C) 2026 The DerpFest Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Skip the package-exist EPPE enforcement: the device tree ships the
# prebuilt power-HAL libperfmgr which is not in the internal allow-list.
TARGET_DISABLE_EPPE := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/samsung/e3q/device.mk)

# Inherit from the DerpFest configuration (derpfest.mk pulls in GMS).
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Keep OpenEUICC in and the stock Google eSIM app out.
PRODUCT_PACKAGES := $(filter-out EuiccGoogle,$(PRODUCT_PACKAGES))

PRODUCT_NAME := derpfest_e3q
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S928B
PRODUCT_MANUFACTURER := Samsung
