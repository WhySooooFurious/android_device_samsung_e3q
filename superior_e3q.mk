#
# Copyright (C) 2026 The SuperiorOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# GMS: SuperiorOS's vendor/superior/config/common.mk wires gapps directly
# via WITH_GAPPS, so no vendor/pixel/gms inherit is needed.
WITH_GAPPS := true

# Skip the package-exist EPPE enforcement: the device tree ships the
# prebuilt power-HAL libperfmgr which is not in the internal allow-list.
TARGET_DISABLE_EPPE := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/samsung/e3q/device.mk)

# Inherit from the SuperiorOS configuration (common.mk pulls in the
# SuperiorOS apps + gapps wiring via WITH_GAPPS).
$(call inherit-product, vendor/superior/config/common.mk)

# Keep OpenEUICC in and the stock Google eSIM app out (the Exynoobs 24.0
# vendor packages EuiccGoogle; the effective filter-out sits at the end of
# vendor/samsung/sm8650-common/sm8650-common-vendor.mk, this is double-safety).
PRODUCT_PACKAGES := $(filter-out EuiccGoogle,$(PRODUCT_PACKAGES))

PRODUCT_NAME := superior_e3q
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S928B
PRODUCT_MANUFACTURER := Samsung
