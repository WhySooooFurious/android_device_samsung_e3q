#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths_pineapple.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_pineapple/mixer_paths_pineapple_mtp.xml \
    $(LOCAL_PATH)/configs/audio/resourcemanager_pineapple.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_pineapple/resourcemanager_pineapple_mtp.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 3120
TARGET_SCREEN_WIDTH := 1440

# Display config (stock DDC renamed to live unique display id)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display/displayconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_4630946315032985731.xml

# FlipFlap
PRODUCT_PACKAGES += \
    FlipFlap

# Init
PRODUCT_PACKAGES += \
    init.e3q.rc

# Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResE3q \
    LineageResE3q \
    SystemUIResE3q \
    WifiResTargetE3q

# Power
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/powerhint.json:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.json

# Touch features
PRODUCT_PACKAGES += \
    vendor.lineage.touch-service.samsung

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlanmdsp.otaupdate_symlink \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/samsung/sm8650-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/samsung/e3q/e3q-vendor.mk)

# USB: adb always exposed by default, no auth dialog (userdebug convenience)
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0
