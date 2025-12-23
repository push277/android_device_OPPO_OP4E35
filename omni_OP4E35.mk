# OP4E35 (PDVM00) omni_OP4E35.mk
# Product build property overrides
$(call inherit-product, device/OPPO/OP4E35/device.mk)

# Override build properties (match device fingerprint)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=OPPO/PDVM00/OP4E35:11/RKQ1.201217.002/1716954220938:user/release-keys \
    PRIVATE_BUILD_DESC="PDVM00-user 11 RKQ1.201217.002 1716954220938 release-keys" \
    RO_BUILD_VERSION=RKQ1.201217.002 \
    RO_PRODUCT_MODEL=PDVM00