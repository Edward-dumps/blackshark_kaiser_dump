#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from kaiser device
$(call inherit-product, device/blackshark/kaiser/device.mk)

PRODUCT_DEVICE := kaiser
PRODUCT_NAME := omni_kaiser
PRODUCT_BRAND := blackshark
PRODUCT_MODEL := SHARK KSR-A0
PRODUCT_MANUFACTURER := blackshark

PRODUCT_GMS_CLIENTID_BASE := android-blackshark

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="KSR-A0-user 11 KASE2205120CN00MR4 V11.0.4.0.JOYUI release-keys"

BUILD_FINGERPRINT := blackshark/KSR-A0/kaiser:11/KASE2205120CN00MR4/V11.0.4.0.JOYUI:user/release-keys
