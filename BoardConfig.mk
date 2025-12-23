# OP4E35 (PDVM00) BoardConfig.mk
# Core build configuration for Snapdragon 4250 (sm4250) | Android 11 | arm64-v8a

# Basic device identification
TARGET_DEVICE := OP4E35
TARGET_BOARD_PLATFORM := sm4250
TARGET_BOARD_PLATFORM_GPU := qcom-adreno610

# CPU/Architecture configuration (matched with ADB results)
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

# Kernel configuration (prebuilt kernel path + ADB-verified cmdline)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 androidboot.console=ttyMSM0 androidboot.hardware=qcom androidboot.bootdevice=4804000.ufshc androidboot.device=OP4E35 androidboot.model=PDVM00
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# Partition configuration (twrpdtgen + ADB verified values)
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 46829568  # 44.7MB (actual value from twrpdtgen)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 46829568
BOARD_SUPER_PARTITION_SIZE := 8598323200     # 8199MB (ADB-verified super partition size)
BOARD_SUPER_PARTITION_GROUPS := OPPO_dynamic_partitions
BOARD_OPPO_DYNAMIC_PARTITIONS_SIZE := 8598323200
BOARD_OPPO_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product system_ext

# TWRP core configuration (adapted to device hardware)
TW_THEME := portrait_hdpi                    # Match 720x1600 screen + 440dpi
TW_EXTRA_LANGUAGES := true                   # Enable multi-language support
TW_INCLUDE_CRYPTO := true                    # Support device encryption (encrypted state)
TW_USE_TOOLBOX := true                       # Use toolbox instead of toybox
TW_BRIGHTNESS_PATH := /sys/devices/platform/soc/5e00000.qcom,mdss_mdp/backlight/panel0-backlight/brightness  # ADB-verified brightness path
TW_MAX_BRIGHTNESS := 255                     # Max brightness for OPPO sm4250 platform
TW_DEFAULT_BRIGHTNESS := 150                 # Default boot brightness
TW_INPUT_BLACKLIST := "hbtp_vm"              # Block virtual key interference
TW_SCREEN_BLANK_ON_BOOT := true              # Blank screen on recovery boot
TW_INCLUDE_FBE := true                       # Support File-Based Encryption (FBE)
TW_SUPPORT_INPUT_USB_KEYBOARD := true        # Support USB keyboard input

# QCOM platform & security configuration
BOARD_USES_QCOM_HARDWARE := true             # Enable QCOM hardware support
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
TW_EXCLUDE_DEFAULT_USB_INIT := true          # Exclude default USB initialization (QCOM-specific)
PLATFORM_SECURITY_PATCH := 2099-12-31        # Bypass rollback protection
PLATFORM_VERSION := 16.1.0                   # Match OmniROM version

# Filesystem support
BOARD_HAS_LARGE_FILESYSTEM := true           # Support large files (>4GB)
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs # Userdata uses F2FS (ADB-verified)
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4   # System uses EXT4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4   # Vendor uses EXT4