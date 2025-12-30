# OP4E35 (PDVM00) BoardConfig.mk
# All parameters from device terminal output (Root)
# Platform: Qualcomm Bengal | Android 11 | arm64-v8a
# ====================== CPU/Architecture (Device-Verified) ======================
TARGET_DEVICE := OP4E35
TARGET_BOARD_PLATFORM := bengal  # from getprop ro.board.platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno610v1  # from /sys/class/kgsl/kgsl-3d0/gpu_model

# Primary architecture (arm64-v8a from getprop ro.product.cpu.abi)
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a  # CPU architecture: 8 = armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

# Secondary architecture (32-bit fallback, from abilist)
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# ====================== Kernel Configuration (Device-Verified) ======================
# Prebuilt kernel path (commented by default to fix "kernel not found" error)
# Uncomment only if prebuilt/kernel file exists in device tree directory
TARGET_PREBUILT_KERNEL := device/OPPO/OP4E35/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := device/OPPO/OP4E35/prebuilt/dtbo
BOARD_PREBUILT_DTBIMAGE := device/OPPO/OP4E35/prebuilt/dtb
# Full kernel cmdline (from cat /proc/cmdline)
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x4a90000 androidboot.hardware=OP4E35 androidboot.console=ttyMSM0 androidboot.memcg=1 androidboot.prjname=20021 androidboot.fstab_suffix=default androidboot.dtbo_idx=7 androidboot.dtb_idx=4 androidboot.bootdevice=4804000.ufshc androidboot.selinux=permissive

# Kernel base/pagesize (Bengal platform default, blockdev --getbsz boot = 4096)
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb  # Bengal platform default

# ====================== Partition Configuration (Device-Verified) ======================
BOARD_FLASH_BLOCK_SIZE := 4096  # from blockdev --getbsz /dev/block/by-name/boot

# Partition paths (from ls -l /dev/block/by-name/)
BOARD_BOOTIMAGE_PARTITION_DEVICE := /dev/block/sde11
BOARD_RECOVERYIMAGE_PARTITION_DEVICE := /dev/block/sda8
BOARD_SUPER_PARTITION_DEVICE := /dev/block/sda6  # Verified super partition path

# Partition size (twrpdtgen verified / Bengal platform default)
BOARD_BOOTIMAGE_PARTITION_SIZE := 46829568  # 44.7MB
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 46829568
BOARD_SUPER_PARTITION_SIZE := 8617048064    # 8199MB (dynamic partition)

# Dynamic partitions (getprop ro.boot.dynamic_partitions = true)
BOARD_SUPER_PARTITION_GROUPS := OPPO_dynamic_partitions
BOARD_OPPO_DYNAMIC_PARTITIONS_SIZE := 8600000000
BOARD_OPPO_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm system_ext my_product my_engineering my_heytap my_stock my_region my_carrier my_preload my_company my_manifest
BOARD_USES_METADATA_PARTITION := true  # Fix dynamic partition validation error

# ====================== TWRP Configuration (Device-Verified) ======================
# Screen (wm size = 720x1600, wm density = 320)
TW_THEME := portrait_hdpi
TW_SCREEN_WIDTH := 720
TW_SCREEN_HEIGHT := 1600

# Brightness (device-verified path & max value)
TW_BRIGHTNESS_PATH := "/sys/devices/platform/soc/5e00000.qcom,mdss_mdp/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := "4095"
TW_DEFAULT_BRIGHTNESS := "2048"

# Encryption (getprop ro.crypto.state=encrypted, ro.crypto.type=file)
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true  # File-Based Encryption
TW_INCLUDE_FBE_METADATA_DECRYPT := true  # Fix FBE decryption
TW_USE_TOOLBOX := true

# Input/UI
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_SCREEN_BLANK_ON_BOOT := true
TW_SUPPORT_INPUT_USB_KEYBOARD := true

# ====================== AVB ======================
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 0
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
# ====================== QCOM Platform Configuration ======================
BOARD_USES_QCOM_HARDWARE := true
TW_EXCLUDE_DEFAULT_USB_INIT := true  # QCOM-specific USB config

# ====================== Security/Compatibility ======================
PLATFORM_SECURITY_PATCH := 2024-05-01  # Bypass rollback protection
PLATFORM_VERSION := 30 # Match OmniROM Android 11

# ====================== Filesystem (Device-Verified) ======================
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs  # mount | grep /data = f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BUILD_FINGERPRINT:=OPPO/PDVM00/OP4E35:11/RKQ1.201217.002/1716954220938:user/release-keys
BUILD_THUMBPRINT:=30/SP2A.220405.004/eng.runner.20251223.165940:eng/test-keys
