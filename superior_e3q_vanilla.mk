#
# SuperiorOS A17 e3q vanilla (no GMS) product
#
# Copyright (C) 2026 The SuperiorOS Project
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

# Inherit from the SuperiorOS configuration (no GMS: no WITH_GAPPS;
# SuperiorOS's common.mk gapps wiring stays a no-op without it).
$(call inherit-product, vendor/superior/config/common.mk)

# Keep OpenEUICC in and the stock Google eSIM app out.
PRODUCT_PACKAGES := $(filter-out EuiccGoogle,$(PRODUCT_PACKAGES))

PRODUCT_NAME := superior_e3q_vanilla
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S928B
PRODUCT_MANUFACTURER := Samsung
