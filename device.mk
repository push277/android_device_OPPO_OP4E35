LOCAL_PATH := device/OPPO/OP4E35

$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

PRODUCT_NAME := omni_OP4E35
PRODUCT_DEVICE := OP4E35
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := PDVM00
PRODUCT_MANUFACTURER := OPPO
PRODUCT_RELEASE_NAME := OP4E35

PRODUCT_PACKAGES += \
    recovery_rc \
    recovery_sepolicy \
    twrpdigest \
    fastbootd \
    libtinyxml2 \
    crypto_utils

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="PDVM00-user 11 RKQ1.201217.002 1716954220938 release-keys"

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)