# OP4E35 (PDVM00) device.mk
# Core product configuration for TWRP compilation

LOCAL_PATH := device/OPPO/OP4E35

# Inherit OmniROM core configuration (synced via GitHub Actions)
$(call inherit-product, vendor/omni/config/common.mk)

# Basic device information (ADB-verified)
PRODUCT_NAME := omni_OP4E35
PRODUCT_DEVICE := OP4E35
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := PDVM00
PRODUCT_MANUFACTURER := OPPO
PRODUCT_RELEASE_NAME := OP4E35
PRODUCT_BUILD_FINGERPRINT := OPPO/PDVM00/OP4E35:11/RKQ1.201217.002/1716954220938:user/release-keys  # Exact fingerprint from ADB

# Required TWRP build dependencies
PRODUCT_PACKAGES += \
    recovery_rc \
    recovery_sepolicy \
    twrpdigest \
    fastbootd \
    libtinyxml2 \
    crypto_utils

# Copy prebuilt kernel to build directory
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/kernel:kernel

# Dynamic partition & 64-bit support
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)