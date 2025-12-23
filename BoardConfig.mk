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
# TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel

# Full kernel cmdline (from cat /proc/cmdline)
BOARD_KERNEL_CMDLINE := rcupdate.rcu_expedited=1 rcu_nocbs=0-7 kpti=off console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x4a90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7 buildvariant=user lk_version=V1.0 androidboot.startupmode=hard_reset androidboot.mode=reboot printk.disable_uart=1 phx_rus_conf.main_on=1 phx_rus_conf.recovery_method=2 phx_rus_conf.kernel_time=240 phx_rus_conf.android_time=250 smooth_soc_switch=0 simcardnum.doublesim=1 saupwk.en=1 androidboot.prjname=20021 esim.status=0 androidboot.verifiedbootstate=orange androidboot.keymaster=1 androidboot.vbmeta.device=PARTUUID=d32662b2-b302-252a-1a74-a1fa442a1b97 androidboot.vbmeta.avb_version=1.0 androidboot.vbmeta.device_state=unlocked androidboot.vbmeta.hash_alg=sha256 androidboot.vbmeta.size=18048 androidboot.vbmeta.digest=e3491b02450ad1af3c5d768356abb077b85d143163a6e2935b7ecaa8b71354ee androidboot.vbmeta.invalidate_on_error=yes androidboot.veritymode=enforcing androidboot.bootdevice=4804000.ufshc androidboot.fstab_suffix=default androidboot.boot_devices=soc/4804000.ufshc androidboot.serialno=eadd25a9 androidboot.baseband=msm msm_drm.dsi_display0=qcom,mdss_dsi_ili9882n_90hz_inx_video: androidboot.dtbo_idx=7 androidboot.dtb_idx=4

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
BOARD_SUPER_PARTITION_SIZE := 8598323200    # 8199MB (dynamic partition)

# Dynamic partitions (getprop ro.boot.dynamic_partitions = true)
BOARD_SUPER_PARTITION_GROUPS := OPPO_dynamic_partitions
BOARD_OPPO_DYNAMIC_PARTITIONS_SIZE := 8598323200
BOARD_OPPO_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product system_ext
BOARD_USES_METADATA_PARTITION := true  # Fix dynamic partition validation error

# ====================== TWRP Configuration (Device-Verified) ======================
# Screen (wm size = 720x1600, wm density = 320)
TW_THEME := portrait_hdpi
TW_SCREEN_WIDTH := 720
TW_SCREEN_HEIGHT := 1600

# Brightness (device-verified path & max value)
TW_BRIGHTNESS_PATH := /sys/devices/platform/soc/5e00000.qcom,mdss_mdp/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 4095  # Actual max brightness from device
TW_DEFAULT_BRIGHTNESS := 2048  # Middle value (4095/2)

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

# ====================== QCOM Platform Configuration ======================
BOARD_USES_QCOM_HARDWARE := true
TW_EXCLUDE_DEFAULT_USB_INIT := true  # QCOM-specific USB config

# ====================== Security/Compatibility ======================
PLATFORM_SECURITY_PATCH := 2099-12-31  # Bypass rollback protection
PLATFORM_VERSION := 30 # Match OmniROM Android 11

# ====================== Filesystem (Device-Verified) ======================
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs  # mount | grep /data = f2fs
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor