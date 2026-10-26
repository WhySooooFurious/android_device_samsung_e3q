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

# Inherit from the VoltageOS configuration.
$(call inherit-product, vendor/voltage/config/common_full_phone.mk)

PRODUCT_NAME := voltage_e3q
PRODUCT_DEVICE := e3q
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-S928B
PRODUCT_MANUFACTURER := Samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# The public voltage-priv template repo sets PRODUCT_CERTIFICATE_OVERRIDES
# (apex -> <apex>.certificate.override) but ships no .bp defining those
# modules, which fails soong module resolution. Clear the list so apexes
# fall back to their default certificates.
PRODUCT_CERTIFICATE_OVERRIDES :=

# The VoltageOS base requires Lineage HALs (health/livedisplay/powershare/touch/
# radio.config) in its product framework compatibility matrix. e3q's vendor image
# provides none of them, which fails the boot-time VINTF check (stuck at boot logo).
PRODUCT_PACKAGES := $(filter-out framework_compatibility_matrix.lineage.xml,$(PRODUCT_PACKAGES))

# Unofficial builds need adb without per-host authorization dialog.
PRODUCT_PROPERTY_OVERRIDES += ro.adb.secure=0
