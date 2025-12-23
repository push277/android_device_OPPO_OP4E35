#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from OP4E35 device
$(call inherit-product, device/OPPO/OP4E35/device.mk)

PRODUCT_DEVICE := OP4E35
PRODUCT_NAME := omni_OP4E35
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := PDVM00
PRODUCT_MANUFACTURER := OPPO

PRODUCT_GMS_CLIENTID_BASE := android-OPPO

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC=""

BUILD_FINGERPRINT := 
