# OP4E35 (PDVM00) AndroidProducts.mk
# Comply with Android build system v11+ standards
LOCAL_PATH := $(call my-dir)

# Define valid lunch choices (match product name: omni_OP4E35)
COMMON_LUNCH_CHOICES := \
    omni_OP4E35-eng \
    omni_OP4E35-user \
    omni_OP4E35-userdebug

# Critical: Map product name to its makefile (MANDATORY for product recognition)
PRODUCT_MAKEFILES := \
    $(LOCAL_PATH)/omni_OP4E35.mk:omni_OP4E35

# Device identification for build system recognition
PRODUCT_BRAND := OPPO
PRODUCT_DEVICE := OP4E35
PRODUCT_MANUFACTURER := OPPO
PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
    ro.product.device=OP4E35 \
    ro.product.model=PDVM00