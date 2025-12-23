# OP4E35 (PDVM00) AndroidProducts.mk
# Define lunch choices and product makefile mapping (replace obsolete vendorsetup.sh)
LOCAL_DIR := $(call my-dir)

# Lunch options for OP4E35 compilation variants
COMMON_LUNCH_CHOICES := \
    omni_OP4E35-user \
    omni_OP4E35-userdebug \
    omni_OP4E35-eng

# Map to the core product configuration file
PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/omni_OP4E35.mk

# Device identification for build system recognition
PRODUCT_BRAND := OPPO
PRODUCT_DEVICE := OP4E35
PRODUCT_MANUFACTURER := OPPO