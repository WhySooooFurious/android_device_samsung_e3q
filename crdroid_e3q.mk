#
# Copyright (C) 2026 The crDroid Project
#
# SPDX-License-Identifier: Apache-2.0
#

# GMS: the base manifest ships no GMS project; the local manifest points
# vendor/pixel/gms at the gms-17 prebuilts (same set as the PixelOS/DerpFest
# A17 builds). crDroid's vendor/lineage config/crdroid.mk already carries the
# GMS props (ro.opa.eligible_device, setupwizard.*, ...).
WITH_GMS := true

# Skip the package-exist EPPE enforcement: the device tree ships the
# prebuilt power-HAL libperfmgr which is not in the internal allow-list.
TARGET_DISABLE_EPPE := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from the device configuration.
$(call inherit-product, device/samsung/e3q/device.mk)

# Inherit from the crDroid configuration (crdroid.mk pulls in the extra
# crDroid apps; common.mk -includes partner_gms.mk, a no-op without the
# vendor/partner_gms path, so GMS is wired below directly).
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# GMS packages (gms-17 prebuilts).
$(call inherit-product, vendor/pixel/gms/products/gms.mk)

# Keep OpenEUICC in and the stock Google eSIM app out (the Exynoobs 24.0
# vendor packages EuiccGoogle; the effective filter-out sits at the end of
# vendor/samsung/sm8650-common/sm8650-common-vendor.mk, this is double-safety).
PRODUCT_PACKAGES := $(filter-out EuiccGoogle,$(PRODUCT_PACKAGES))

PRODUCT_NAME := crdroid_e3q
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S928B
PRODUCT_MANUFACTURER := Samsung
