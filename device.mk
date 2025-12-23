# device/OPPO/OP4E35/device.mk
# Adapted for OPPO OP4E35 (PDVM00) | Android 11 | Snapdragon 4250 | arm64-v8a
LOCAL_PATH := device/OPPO/OP4E35

# 1. Inherit OmniROM core configuration (takes effect after GA syncs source code)
$(call inherit-product, vendor/omni/config/common.mk)

# 2. Device basic information (from ADB results)
PRODUCT_NAME := omni_OP4E35
PRODUCT_DEVICE := OP4E35
PRODUCT_BRAND := OPPO
PRODUCT_MODEL := PDVM00
PRODUCT_MANUFACTURER := OPPO
PRODUCT_RELEASE_NAME := OP4E35
PRODUCT_BUILD_FINGERPRINT := OPPO/PDVM00/OP4E35:11/RKQ1.201217.002/1716954220938:user/release-keys

# 3. CPU architecture (64-bit, arm64-v8a from ADB)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# 4. TWRP core configuration (adapted to parameters from ADB)
TW_THEME := portrait_hdpi  # Adapted for 720x1600 + 320dpi
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_CRYPTO := true  # Required: device encryption status is encrypted
TW_USE_TOOLBOX := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/soc/5e00000.qcom,mdss_mdp/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 255   # Default max brightness for OPPO this platform
TW_DEFAULT_BRIGHTNESS := 150
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"  # Block virtual key interference
TW_SUPPORT_INPUT_USB_KEYBOARD := true
TW_INCLUDE_FBE := true     # Adapt to f2fs encryption of userdata

# 5. Compilation dependency packages (required for TWRP)
PRODUCT_PACKAGES += \
    recovery_rc \
    recovery_sepolicy \
    twrpdigest \
    fastbootd \
    libtinyxml2 \
    crypto_utils

# 6. Partition configuration (from ADB blocks size, converted to bytes: 98304*1024=100663296)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296  # boot partition 96MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296  # recovery partition 96MB
BOARD_FLASH_BLOCK_SIZE := 131072  # General block size
BOARD_VENDOR := oppo
BOARD_USES_RECOVERY_AS_BOOT := false

# 7. Kernel configuration (from ADB kernel command line)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel  # Place precompiled kernel here if available
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.bootdevice=4804000.ufshc
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb  # General image name for Snapdragon 4250

# 8. Dynamic partition adaptation (super partition)
BOARD_SUPER_PARTITION_SIZE := 8598323200  # 8199MB (from 8396800 blocks in ADB)
BOARD_SUPER_PARTITION_GROUPS := oppo_dynamic_partitions
BOARD_OPPO_DYNAMIC_PARTITIONS_SIZE := 8598323200
BOARD_OPPO_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor

# 9. Storage adaptation (userdata is f2fs)
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_HAS_LARGE_FILESYSTEM := true
TW_EXCLUDE_DEFAULT_USB_INIT := true